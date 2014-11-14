class BorrowSerializer < ActiveModel::Serializer
  attributes :id, :item, :created_at, :updated_at, :status, :user, :hand_off

  def user
  	object.item.user
  end

  def item
  	object.item
  end

  def hand_off
  	object.hand_off
  end
end
