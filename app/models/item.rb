class Item < ActiveRecord::Base
	validates :status, 
				format: {with: /free|taken/},
				presence: true

	validates :value,
						presence: true,
						numericality: { greater_than_or_equal_to: 0 }

	belongs_to :user
	has_many :borrows

	mount_uploader :image, ImageUploader
end