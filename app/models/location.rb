class Location < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: true

  def city_and_state
    if self.city == nil || self.city == ""
      self.state
    else
      self.city + ", " + self.state
    end
  end

  def self.options
    self.select(:state).distinct.order(:state)
  end

  def self.search(search)
    if search
      location = Location.find_by(state: search)
      if location
        self.where(state: location.state)
      else
        self.all
      end
    else
      self.all
    end
  end
end
