class HandOff < ActiveRecord::Base
	after_update :update_status
	belongs_to :borrow

	def borrower
		self.borrow.borrower
	end

	def lender
		self.borrow.lender
	end

	def next_step commiter_id
		unless status >= 4
			if (status % 2 == 0) && (self.borrower.id == commiter_id)
				self.update_attribute(:status, self.status + 1)	
			elsif (status % 2 == 1) && (self.lender.id == commiter_id)
				self.update_attribute(:status, self.status + 1)
			end
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
