class HandOff < ActiveRecord::Base
	after_update :update_status
	belongs_to :borrow

	def borrower
		self.borrow.borrower
	end

	def lender
		self.borrow.lender
	end

	def update_status
		if(self.status_changed?)
			if(self.status == 2)
				self.borrow.update_attribute(:status, "taken")
			end
			if(self.status == 3)
				self.borrow.update_attribute(:status, "done")
			end
		end
	end
end
