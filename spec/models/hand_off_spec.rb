require 'rails_helper'

RSpec.describe HandOff, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "asociations" do
  	it { should belong_to(:borrow) }
  end

  it "should not allow more than 4 steps" do
    item = FactoryGirl.create(:item)
    borrow = FactoryGirl.create(:borrow, item_id: item.id)
  	hand_off = FactoryGirl.create(:hand_off, borrow_id: borrow.id)
  	expect(hand_off.status).to be(1)
  	hand_off.next_step
  	expect(hand_off.status).to be(2)
  	hand_off.next_step
  	expect(hand_off.status).to be(3)
  	hand_off.next_step
  	expect(hand_off.status).to be(4)
  	hand_off.next_step
  	expect(hand_off.status).to be(4)
  end
end
