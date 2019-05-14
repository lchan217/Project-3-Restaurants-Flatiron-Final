class AddOccasionToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :occasion, :string
  end
end
