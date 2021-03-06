class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many :items
  has_many :borrows, foreign_key: "borrower_id", class_name: Borrow

  def borrow!(item_id)
  	self.borrows.create(item_id: item_id)
  end
end
