class Restaurant < ApplicationRecord
  has_many :locations
  has_many :items
  accepts_nested_attributes_for :locations

  def location
    if self.location_id
      Location.find(self.location_id)
    end
  end

  def wifi?
    self.wifi ? "Yes" : "No"
  end

  def reservations
    self.reservations? ? "Yes" : "No"
  end
end
