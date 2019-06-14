class Restaurant < ApplicationRecord
  has_many :locations
  has_many :items
  has_many :users, through: :locations

  #validates_presence_of :name, { message: "Name can't be blank"}
  # validate :rating_not_higher_than_five

  accepts_nested_attributes_for :locations #,reject_if: proc { |attributes| attributes[:state].blank? }

  def self.search(search)
    if search
      restaurant = Restaurant.find_by(state: search)
      if restaurant
        self.where(state: restaurant.state)
      else
        self.all
      end
    else
      self.all
    end
  end

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

  def rating_not_higher_than_five
    if rating.to_i > 5 || rating.to_i < 1
     errors.add(:rating, "Rating must be between 1 and 5")
    end
  end
end
