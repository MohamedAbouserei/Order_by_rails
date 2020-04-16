class OrderUser < ActiveRecord::Migration[5.2]
  def change
    create_table :orderusers do |t|
      t.timestamps
      end
    add_reference :orderusers, :model, index: true,:null =>false
    add_foreign_key :orderusers, :models
    add_reference :orderusers, :forder, index: true,:null =>false
    add_foreign_key :orderusers, :forders
    
    
  end
end