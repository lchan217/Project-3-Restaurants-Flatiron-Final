class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :state, presence: true

  def city_and_state
    self.city + ", " + self.state
  end

  def location
    Restaurant.find(self.restaurant_id)
  end
end