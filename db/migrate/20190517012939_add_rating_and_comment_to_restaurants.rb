class AddRatingAndCommentToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :rating, :string
    add_column :restaurants, :comment, :text
  end
end
