class RemoveUnneededColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :location_id
    remove_column :restaurants, :city
    remove_column :restaurants, :state
  end
end
