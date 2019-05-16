class Restaurant < ApplicationRecord
  has_many :locations
  has_many :items
  has_many :users, through: :locations

  validates_presence_of :name, { message: "Name can't be blank"}

  accepts_nested_attributes_for :locations
  #
  # def self.with_wifi
  #   self.where(wifi: "yes").order(:name)
  # end

  def self.search(search)
    if search
      restaurant = Restaurant.find_by(price_range: search)
      if restaurant
        self.where(price_range: restaurant.price_range)
      else
        self.all
      end
    else
      self.all
    end
  end

 #  def locations_attributes=(locations_attributes)
 #   locations_attributes.values.each do |location_atts|
 #     if location_atts[:city] != "" && location_atts[:state] != ""
 #       self.locations.build(location_atts)
 #     end
 #   end
 # end

  # def location
  #   if self.location_id
  #     Location.find(self.location_id)
  #   end
  # end

end
