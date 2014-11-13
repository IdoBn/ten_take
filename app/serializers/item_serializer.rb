class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :created_at, :updated_at, :status, :value

  has_one :user

  def image
  	object.image.url
  end
end