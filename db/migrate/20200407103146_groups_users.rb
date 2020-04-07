class GroupsUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :model, index: true
    add_foreign_key :groups, :models
  end
end
