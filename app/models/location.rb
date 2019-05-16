class Location < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: true

  validates :state, presence: true

  def city_and_state
    if self.city && self.state
      self.city + ", " + self.state
    end
  end
end
