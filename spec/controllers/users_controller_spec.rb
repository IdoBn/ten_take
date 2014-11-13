require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    let(:user) {FactoryGirl.create(:user)}
    it "returns http success" do
      get :show, id: user.id 
      expect(response).to have_http_status(:success)
    end
  end
 #bronfer
end
