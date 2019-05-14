class AddLocationIdToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :location_id, :integer
  end
end
