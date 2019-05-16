class ChangeReservationsToBeStringInRestaurants < ActiveRecord::Migration[5.2]
  def change
     change_column :restaurants, :reservations?, :string
  end
end
