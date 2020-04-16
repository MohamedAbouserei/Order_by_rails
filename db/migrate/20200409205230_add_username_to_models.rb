class AddUsernameToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :username, :string
    add_index :models, :username, unique: true
  end
end
