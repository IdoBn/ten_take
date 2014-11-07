class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many :items
  has_many :borrows, foreign_key: "borrower_id", class_name: Borrow
end
