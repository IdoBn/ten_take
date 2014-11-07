class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many :items
  has_many :borrows, foreign_key: "borrower_id", class_name: Borrow

  def borrow!(item)
  	self.borrows.create(item_id: item.id)
  end
end
