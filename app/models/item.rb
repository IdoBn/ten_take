class Item < ActiveRecord::Base
	validates :status, 
				format: {with: /free|taken/},
				presence: true

	belongs_to :user
	has_many :borrows

	mount_uploader :image, ImageUploader
end