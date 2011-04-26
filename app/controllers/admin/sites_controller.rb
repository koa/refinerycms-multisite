class Admin::SitesController < Admin::BaseController
  helper :refinery_settings

  crudify :site,
          :title_attribute => :name,
          :order => "name ASC",
          #:redirect_to_url => :redirect_to_where?,
          :xhr_paging => true

end
