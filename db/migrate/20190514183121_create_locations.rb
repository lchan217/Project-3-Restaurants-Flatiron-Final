class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.integer :user_id
      t.integer :restaurant_id
    end
  end
end
