class Board < ApplicationRecord
  belongs_to :user
  belongs_to :cheese 
end
