class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image, :uid, :provider, :created_at, :updated_at, :points
end
