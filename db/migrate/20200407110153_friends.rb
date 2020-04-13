class Friends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
    t.column "action", :boolean ,:null =>false , default: 0
    t.timestamps
    end
    add_reference :friends, :request, index: true , foreign_key: { to_table: :models }
    add_reference :friends, :reciver, index: true , foreign_key: { to_table: :models }
  end
  
end
