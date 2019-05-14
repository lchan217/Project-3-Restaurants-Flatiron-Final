class CreateCheeses < ActiveRecord::Migration[5.2]
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :country
      t.string :type
      t.string :texture
      t.string :animal
      t.text :picture
      t.timestamps
    end
  end
end
