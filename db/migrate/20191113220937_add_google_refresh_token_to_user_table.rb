class AddGoogleRefreshTokenToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :google_refresh_toknn, :string
  end
end
