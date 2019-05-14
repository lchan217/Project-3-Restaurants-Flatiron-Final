class DeleteBoardsAndCheeses < ActiveRecord::Migration[5.2]
  def change
    drop_table :cheeses
    drop_table :boards
  end
end
