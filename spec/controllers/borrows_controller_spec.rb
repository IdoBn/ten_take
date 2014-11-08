require 'rails_helper'

RSpec.describe BorrowsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  # let(:item) { FactoryGirl.create() }
  before(:each) do
    allow(controller).to receive(:current_user) { user }
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    let(:borrow) { FactoryGirl.create(:borrow) }
    it "returns http success" do
      get :show, id: borrow.id
      expect(response).to have_http_status(:success)
    end
  end

  # describe "PUT update" do
  #   let(:borrow) { FactoryGirl.create(:borrow) }
  #   it "returns http success" do
  #     put :update, {id: borrow.id, borrow: {}}
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST create" do
    let(:user2) { FactoryGirl.create(:user) }
    let(:item) { FactoryGirl.create(:item, user_id: user2.id) }

    it "returns http success" do
      post :create, { item_id: item.id }
      expect(response).to have_http_status(:success)
    end

    it "user has a new borrow" do
      expect {
        post :create, { item_id: item.id }
      }.to change { user.borrows.count }.by(1)
    end

    it "returns errors when there is no item_id" do
      post :create
      expect(JSON.parse(response.body)["errors"]).to include("Item can't be blank")
    end
  end

end
