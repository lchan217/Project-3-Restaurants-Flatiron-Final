class AddTakesReservationColumnToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :takeS_reservations, :string
  end
end
