class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :forders do |t|
      t.column "meal", :string ,:null =>false, :limit => 50
      t.column "resturant",:string ,:null =>false, :limit => 50  
      t.column "image", :string ,:null =>true, :limit => 50    
      t.timestamps
      end
    add_reference :forders, :model, index: true
    add_foreign_key :forders, :models
    
    
  end
end
