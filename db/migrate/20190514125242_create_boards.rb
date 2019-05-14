class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :size
      t.integer :user_id
      t.integer :cheese_id
      t.integer :meat_id
      t.integer :olive_id
      t.integer :cracker_id

      t.timestamps
    end
  end
end
