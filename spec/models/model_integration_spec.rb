require 'rails_helper'

RSpec.describe "Integration_model",  :type => :model do
	let (:user_a) { FactoryGirl.create :user }
	let (:item) { FactoryGirl.create :item , user_id: user_a.id}
	let (:user_b)	{ FactoryGirl.create :user }
	let (:borrow) { FactoryGirl.create :borrow , borrower_id: user_b.id ,item_id: item.id}
	let (:hand_off) { FactoryGirl.create :hand_off, borrow_id: borrow.id, status: 1}

	it { expect(item.user).to eq(user_a) }
	it { expect(borrow.lender).to eq(user_a) }
	it { expect(borrow.borrower).to eq(user_b) }
	it { expect(hand_off.borrower).to eq(user_b) }
	it { expect(hand_off.lender).to eq(user_a) }

	it "user_b's gets" do
		item = user_a.items.create
		expect(item.status).to eq("free")
		borrow = user_b.borrows.create(item_id: item.id)
		expect(item.borrows).to include(borrow)
		hanop = borrow.hand_offs.create
		expect(hanop.status).to eq(1)
		hanop.update_attribute(:status,2)
		expect(borrow.status).to eq("taken")
		expect(item.reload.status).to eq("taken")
		hanop.update_attribute(:status ,3)
		expect(hanop.status).to eq(3)
		hanop.update_attribute(:status , 4)
		expect(borrow.status).to eq("done")
		expect(item.reload.status).to eq("free")
	end

end