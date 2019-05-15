class Location < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: true

  def city_and_state
    self.city + ", " + self.state
  end
  #
  # def location
  #   Restaurant.find(self.restaurant_id)
  # end
end
