class Restaurant < ApplicationRecord
  has_many :locations
  has_many :items

  def location
    if location_id
      Location.find(self.location_id)
    end
  end
end