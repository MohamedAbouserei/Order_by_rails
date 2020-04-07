class OrderUser < ActiveRecord::Migration[5.2]
  def change
    create_table :orderuser do |t|
      t.timestamps
      end
    add_reference :orderuser, :model, index: true,:null =>false
    add_foreign_key :orderuser, :models
    add_reference :orderuser, :forder, index: true,:null =>false
    add_foreign_key :orderuser, :forders
    
    
  end
end