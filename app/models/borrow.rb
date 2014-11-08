class Borrow < ActiveRecord::Base
	after_update :update_status

	belongs_to :borrower, class_name: "User"
	belongs_to :item
	has_many :hand_offs

	validates :item_id, presence: true

	def lender
		self.item.user
	end

	def hand_off!
		self.hand_offs.create
	end

	def update_status
		if(self.status_changed?)
			if(self.status == "taken")
				self.item.update_attribute(:status, "taken")
			end
			if(self.status == "done")
				self.item.update_attribute(:status, "free")
			end
		end
	end
end
