class HandOff < ActiveRecord::Base
	after_update :update_status
	belongs_to :borrow

	def item
		self.borrow.item
	end

	def borrower
		self.borrow.borrower
	end

	def lender
		self.borrow.lender
	end

	def next_step
		unless status >= 4
			self.update_attribute(:status, self.status + 1)
		end
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
