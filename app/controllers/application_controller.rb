class ApplicationController < ActionController::Base
  before_filter :load_site
  protect_from_forgery
  protected
  def load_site
    @site = Site.find_by_hostname(request.host)
  end
end
