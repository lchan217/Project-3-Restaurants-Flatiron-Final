class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :vegetarian, :calories, :price, :category
  belongs_to :restaurant
end
