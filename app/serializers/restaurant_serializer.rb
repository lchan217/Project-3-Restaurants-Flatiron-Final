class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :price_range, :wifi, :occasion, :takeS_reservations, :rating, :comment
  has_many :items
  has_many :locations
end
