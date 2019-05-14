class AddFirmnessToCheese < ActiveRecord::Migration[5.2]
  def change
    add_column :cheeses, :firmness, :string
  end
end
