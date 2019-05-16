class RemoveQuestionMarks < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :vegetarian?, :vegetarian
    rename_column :restaurants, :reservations?, :reservation
  end
end
