require 'spec_helper'

describe Hostname do
  it 'initializes' do
    Hostname.new.should_not be_nil
  end
  describe "hostname" do
    it {should allow_value('localhost').for(:hostname)}
  end
  describe "find host example.com" do
    it 'find saved hostname' do
      Factory.build(:hostname, :hostname=>'example.com').save

      Hostname.find_by_hostname('example.com').should_not be_nil
    end
  end
end
