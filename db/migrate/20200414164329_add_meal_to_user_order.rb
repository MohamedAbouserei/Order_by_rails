class AddMealToUserOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orderusers, :meal, :string
  end
end
