class AddItemToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :item, foreign_key: true
  end
end
