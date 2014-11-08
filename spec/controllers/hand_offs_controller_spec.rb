require 'rails_helper'

RSpec.describe HandOffsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    allow(controller).to receive(:current_user) { user }
  end

  describe "GET create" do
    let(:borrow) { FactoryGirl.create(:borrow) }
    it "returns http success" do
      get :create , borrow_id: borrow.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    let (:user_a) { FactoryGirl.create :user }
    let (:item) { FactoryGirl.create :item , user_id: user_a.id}
    let (:user_b) { FactoryGirl.create :user }
    let (:borrow) { FactoryGirl.create :borrow , borrower_id: user_b.id ,item_id: item.id}
    let (:hand_off) { FactoryGirl.create :hand_off, borrow_id: borrow.id}

    before(:each) do
      allow(controller).to receive(:current_user) { user_a }
    end

    it "returns http success" do
      put :update , id: hand_off.id
      expect(response).to have_http_status(:success)
    end
  end

end
