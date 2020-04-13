class AddForienKeyToFriends < ActiveRecord::Migration[6.0]
  def change
    add_reference :friends, :friend, foreign_key: true
    add_reference :friends, :model, foreign_key: true
  end
end
