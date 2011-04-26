require 'spec_helper'
require File.expand_path('../../factories', __FILE__)

describe Site do
  describe 'find sites by hostname' do
    Factory.build(:site).save
    puts Site.find_by_hostname('example.com')
  end
end
