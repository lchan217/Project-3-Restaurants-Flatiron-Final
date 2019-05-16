class DeleteReservationColumnFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :reservation
  end
end
