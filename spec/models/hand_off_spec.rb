require 'rails_helper'

RSpec.describe HandOff, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "asociations" do
  	it { should belong_to(:borrow) }
  end

  it 'should add points to lending user on step 2' do
    user_a = FactoryGirl.create(:user)
    user_b = FactoryGirl.create(:user)
    expect(user_a.points).to be(5)
    expect(user_b.points).to be(5)

    item = FactoryGirl.create(:item,user_id: user_a.id, value: 5)
    borrow = FactoryGirl.create(:borrow, item_id: item.id, borrower_id: user_b.id)
    hand_off = FactoryGirl.create(:hand_off, borrow_id: borrow.id)

    expect(hand_off.status).to be(1)
    hand_off.next_step(user_a.id)
    expect(hand_off.status).to be(2)
    expect(user_a.reload.points).to be(10)
    expect(user_b.reload.points).to be(0)
  end

  it 'does not go up a state if user does not have enough points' do
    user_a = FactoryGirl.create(:user)
    user_b = FactoryGirl.create(:user)
    expect(user_a.points).to be(5)
    expect(user_b.points).to be(5)

    item = FactoryGirl.create(:item,user_id: user_a.id, value: 10)
    borrow = FactoryGirl.create(:borrow, item_id: item.id, borrower_id: user_b.id)
    hand_off = FactoryGirl.create(:hand_off, borrow_id: borrow.id)

    expect(hand_off.status).to be(1)
    hand_off.next_step(user_a.id)
    expect(hand_off.status).to be(1)
    expect(user_a.reload.points).to be(5)
    expect(user_b.reload.points).to be(5)
  end

  it "should not allow more than 4 steps" do
    user_a = FactoryGirl.create(:user)
    user_b = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item,user_id: user_a.id)
    borrow = FactoryGirl.create(:borrow, item_id: item.id, borrower_id: user_b.id)
  	hand_off = FactoryGirl.create(:hand_off, borrow_id: borrow.id)

  	expect(hand_off.status).to be(1)
  	hand_off.next_step(user_a.id)
  	expect(hand_off.status).to be(2)
  	hand_off.next_step(user_b.id)
  	expect(hand_off.status).to be(3)
  	hand_off.next_step(user_a.id)
  	expect(hand_off.status).to be(4)
  	hand_off.next_step(user_a.id)
  	expect(hand_off.status).to be(4)
  end
end
