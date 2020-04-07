class GroupUser < ActiveRecord::Migration[5.2]
  def change
    create_table :groupuser do |t|
      t.timestamps
      end
    add_reference :groupuser, :model, index: true,:null =>false
    add_foreign_key :groupuser, :models
    add_reference :groupuser, :fgroup, index: true,:null =>false
    add_foreign_key :groupuser, :fgroups
    
    
  end
end
