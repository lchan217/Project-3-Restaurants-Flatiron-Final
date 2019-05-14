class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :type
      t.string :price_range
      t.boolean :reservations?
      t.string :parking
      t.string :wifi

      t.timestamps
    end
  end
end
