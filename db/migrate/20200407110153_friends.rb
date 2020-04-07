class Friends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
    t.column "status", :integer ,:null =>false
    t.timestamps
    end
  add_reference :friends, :model, index: true
  add_foreign_key :friends, :models
  add_reference :friends, :group, index: true
  add_foreign_key :friends, :groups
  end
  
end
