class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image

  has_one :user

  def image
  	object.image.url
  end
end
