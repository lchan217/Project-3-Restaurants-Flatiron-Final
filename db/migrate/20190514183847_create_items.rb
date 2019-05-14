class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.boolean :vegetarian?
      t.string :calories
      t.boolean :lunch_special?
      t.string :restaurant_id

      t.timestamps
    end
  end
end
