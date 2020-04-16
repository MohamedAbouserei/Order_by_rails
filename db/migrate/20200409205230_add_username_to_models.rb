class AddUsernameToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :username, :string
    add_index :models, :username, unique: true
  end
end
