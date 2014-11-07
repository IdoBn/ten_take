class Borrow < ActiveRecord::Base
	belongs_to :borrower, class_name: "User"
	belongs_to :item

	def lender
		self.item.user
	end
end
