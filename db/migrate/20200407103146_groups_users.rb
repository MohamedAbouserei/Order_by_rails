class GroupsUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :fgroups, :model, index: true
    add_foreign_key :fgroups, :models
  end
end
