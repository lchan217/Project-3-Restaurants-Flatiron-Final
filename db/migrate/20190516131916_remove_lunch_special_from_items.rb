class RemoveLunchSpecialFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :lunch_special?
  end
end
