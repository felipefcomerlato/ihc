class CreateJoinTableItemIngredient < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :ingredients do |t|
      # t.index [:item_id, :ingredient_id]
      # t.index [:ingredient_id, :item_id]
    end
  end
end
