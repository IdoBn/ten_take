require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    allow(controller).to receive(:current_user) {user}
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    let(:item) {FactoryGirl.create(:item)}

    it "returns http success" do
      get :show , id: item.id
      expect(response).to have_http_status(:success)
    end
  end

  #describe "PUT update" do    
  #  let(:item) {FactoryGirl.create(:item)}
  #
  #  it "returns http success" do
  #    put :update , {id: item.id
  #    expect(response).to have_http_status(:success)
  #  end
  #end

  describe "POST create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end

    it "returns an item json" do
      post :create
      expect(JSON.parse(response.body)["item"]["id"]).to_not be(nil)   
    end
  end

end
