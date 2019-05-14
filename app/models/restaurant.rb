class Restaurant < ApplicationRecord
  belongs_to :locations 
  has_many :items
end
