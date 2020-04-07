class Notifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifcations do |t | 
      t.column "link", :string 
      t.string "title", :limit => 50, :default => '', :null => false  
      t.string "color", :default => 'blue'  
      t.string "text", :null => false  
      t.timestamps  
end
end
end
