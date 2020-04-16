class AddMealToUserOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orderusers, :meal, :string
  end
end
