class AddContainedToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :contained, :integer
  end
end
