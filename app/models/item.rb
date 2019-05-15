class Item < ApplicationRecord
  belongs_to :restaurant

  def vegetarian
    self.vegetarian? ? "Yes" : "No"
  end

  def lunch_special
    self.lunch_special? ? "Yes" : "No"
  end

end
