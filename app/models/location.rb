class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant 

  def city_and_state
    self.city + ", " + self.state
  end
end
