class Borrow < ActiveRecord::Base
	after_update :update_status

	belongs_to :borrower, class_name: "User"
	belongs_to :item
	has_many :hand_offs

	validates :item_id, presence: true
	validates_uniqueness_of :item_id, scope: [:borrower_id], if: :want?

	def lender
		self.item.user
	end

	def hand_off!
		self.hand_offs.create
	end

	def hand_off
		HandOff.find_by(borrow_id: self.id)
	end

	def want?
		self.status == 'want'
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
