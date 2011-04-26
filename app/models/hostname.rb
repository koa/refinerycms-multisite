class Hostname < ActiveRecord::Base
  belongs_to :site
  attr_accessible :hostname, :created_at, :updated_at, :site_id
end
