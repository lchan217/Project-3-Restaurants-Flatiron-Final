class Location < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: true
  #validates_presence_of :state, { message: "State can't be blank"}
  #validate :at_least_one

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
        self.where(state: location.state).order(:city)
      else
        self.all.order(:city)
      end
    else
      self.all.order(:city)
    end
  end

  # def at_least_one
  #   if state == ""
  #     byebug
  #     errors.add(:at_least_one, "Must include at least one state")
  #   end
  # end
end
