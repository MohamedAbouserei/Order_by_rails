class Notifcations < ActiveRecord::Migration[5.2]
  def change
    create_table :notifcations do |t | 
      t.column "link", :string 
      t.string "title", :limit => 50, :default => '', :null => false  
      t.string "color", :default => 'blue'
      t.string "icon"
      t.boolean :seen, default: 0
      t.boolean :watch, default: 0
      t.string "text", :null => false  
      t.timestamps  
end
add_reference :notifcations, :model, index: true 
add_foreign_key :notifcations, :models


end
end
