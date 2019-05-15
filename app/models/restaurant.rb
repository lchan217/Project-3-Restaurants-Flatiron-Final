class Restaurant < ApplicationRecord
  has_many :locations
  has_many :items
  has_many :users, through: :locations

  #accepts_nested_attributes_for :locations

  def locations_attributes=(locations_attributes)
   locations_attributes.values.each do |location_atts|
     if location_atts[:city] != "" && location_atts[:state] != ""
       # location= location.create(location_atts)
       # self.locations << location
       self.locations.build(location_atts)
     end
   end
 end

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
