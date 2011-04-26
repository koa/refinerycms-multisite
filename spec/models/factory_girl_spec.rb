require 'spec_helper'

describe "FactoryGirl" do

  describe "a hostname by factory" do
    let(:hostname){Factory.build(:hostname)}
    it{hostname.should be_valid}
  end

  describe "a sites by factory" do
    let(:site){Factory.build(:site)}
    it{site.should be_valid}
  end
end
