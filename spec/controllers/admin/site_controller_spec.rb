require 'spec_helper'

describe Admin::SitesController do
  include Devise::TestHelpers

  before(:each) do
    sign_in Factory.create(:refinery_user)
    @origin_site=Factory.create(:site)
    @origin_site.save
  end

  context 'GET on new' do
    before(:each) { get :new }
    it('assigns a new site') { assigns(:site).should be_a_new(Site) }
    it('responds with success') { response.should be_success }
  end

  context 'POST on create' do
    before(:each) { post :create, :post => Factory.attributes_for(:site) }
    it('responds with a redirect') do
      response.should redirect_to(:action=>:index)
    end
    it('creates a new site') { assigns(:site).should_not be_a_new_record }
  end

  context 'persisted site' do
    let(:site) { Factory(:site) }
    context 'GET on edit' do
      before(:each) { get :edit, :id => site }
      it('response with success') { response.should be_success }
    end
    context 'GET on index' do
      before(:each) { get :index }
      it('response with success') { response.should be_success}
      it('assigns sites') do
        assigns(:sites).should include(@origin_site)
      end
    end
  end

end
