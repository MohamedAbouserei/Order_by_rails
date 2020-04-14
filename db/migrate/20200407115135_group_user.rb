class GroupUser < ActiveRecord::Migration[5.2]
  def change
    create_table :groupusers do |t|
      t.timestamps
      end
    add_reference :groupusers, :model, index: true,:null =>false
    add_foreign_key :groupusers, :models
    add_reference :groupusers, :fgroup, index: true,:null =>false
    add_foreign_key :groupusers, :fgroups
    
    
  end
end
