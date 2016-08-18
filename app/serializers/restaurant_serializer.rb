class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :rating, :address
end
