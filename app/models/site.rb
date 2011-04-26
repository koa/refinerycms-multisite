class Site < ActiveRecord::Base
  belongs_to :page
  attr_accessible :name, :page_id, :stylesheet, :hostnames,
                  :hostnames_attributes

  has_many :hostnames,
           :dependent => :destroy

  accepts_nested_attributes_for :hostnames, :allow_destroy => true

  def self.find_by_hostname(hostname)
    Site.joins(:hostnames).where(:hostnames=>{:hostname=>hostname}).first ||
            Site.joins(:hostnames).where(:hostnames=>{:hostname=>'*'}).first
  end

  # Monkey-Patch the Page-Controller for loading the right root-Page
  PagesController.class_eval do
    def home
      if (@site)
        error_404 unless (@page = Page.find(@site.page_id)).present?
      else
        error_404 unless (@page = Page.where(:link_url => '/').first).present?
      end
    end
  end
  # Monkey-Patch the Application-Controller for loading the current site
  ApplicationController.class_eval do
    before_filter :load_site
    protected
    def load_site
      @site = Site.find_by_hostname(request.host)
    end
  end
end
