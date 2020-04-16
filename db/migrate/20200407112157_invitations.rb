class Invitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.timestamps
      end
    add_reference :invitations, :owner, index: true , foreign_key: { to_table: :models }
    add_reference :invitations, :model, index: true,:null =>false
    add_foreign_key :invitations, :models
    add_reference :invitations, :fgroup, index: true,:null =>false
    add_foreign_key :invitations, :fgroups
    
    
  end
end