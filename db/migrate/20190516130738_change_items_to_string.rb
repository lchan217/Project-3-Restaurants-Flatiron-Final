class ChangeItemsToString < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :vegetarian?, :string
    change_column :items, :lunch_special?, :string
  end
end
