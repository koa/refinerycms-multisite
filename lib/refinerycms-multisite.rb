
require 'refinerycms-base'

module Refinery
  module Sites
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sites"
          plugin.activity = {
            :class => Site,
            :title => 'name'
          }
        end
      end
    end
  end
end

class ActionController::Base
  # Loading the Current Site
  before_filter :load_site
  protected
  def load_site
    @site = Site.find_by_hostname(request.host)
    # Monkey-Patch the Page-Controller for loading the right root-Page
    return if ::PagesController.new.respond_to? :home_with_site
    ::PagesController.class_eval do
      def home_with_site
        if (@site)
          error_404 unless (@page = Page.find(@site.page_id)).present?
        else
          home_without_site
        end
      end
      alias_method_chain  :home, :site
    end
  end
end