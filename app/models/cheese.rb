class Cheese < ApplicationRecord
  has_many :boards
  has_many :users, through: :boards 
end
