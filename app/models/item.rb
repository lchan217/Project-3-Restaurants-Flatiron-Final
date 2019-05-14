class Item < ApplicationRecord
  belongs_to :restaurant
  def name_with_restaurant
    self.name + " from " + self.restaurant.name
  end
end
