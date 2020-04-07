class GroupUser < ActiveRecord::Migration[5.2]
  def change
    create_table :groupuser do |t|
      t.timestamps
      end
    add_reference :groupuser, :model, index: true,:null =>false
    add_foreign_key :groupuser, :models
    add_reference :groupuser, :group, index: true,:null =>false
    add_foreign_key :groupuser, :groups
    
    
  end
end
