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
end