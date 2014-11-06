class Item < ActiveRecord::Base
	validates :status, format: {with: /free|taken/}
	belongs_to :user
end