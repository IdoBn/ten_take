class Item < ActiveRecord::Base
	validates :status, 
				format: {with: /free|taken/},
				presence: true
	belongs_to :user
end