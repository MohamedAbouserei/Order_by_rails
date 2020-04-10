class GoogleRefreshToken < ActiveRecord::Migration[6.0]
  def change
    add_column :models, 'google_token', :string
    add_column :models, "google_refresh_token", :string
  end
end
