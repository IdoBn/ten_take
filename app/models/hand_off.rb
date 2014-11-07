class HandOff < ActiveRecord::Base
	belongs_to :borrow

	def borrower
		self.borrow.borrower
	end

	def lender
		self.borrow.lender
	end
end
