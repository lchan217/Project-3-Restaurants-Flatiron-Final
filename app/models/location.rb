class Location < ActiveRecord::Base
  belongs_to :user
  has_many :restaurants

  def city_and_state
    self.city + ", " + self.state
  end
end
