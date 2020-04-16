class AddUserToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :fgroups, :model, index: true
    add_foreign_key :fgroups, :models
  end
end
