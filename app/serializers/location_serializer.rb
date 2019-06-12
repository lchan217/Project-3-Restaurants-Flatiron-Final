class LocationSerializer < ActiveModel::Serializer
  attributes :id, :city, :state
  belongs_to :restaurant
end
