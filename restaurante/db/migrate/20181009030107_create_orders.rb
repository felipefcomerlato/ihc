class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :value
      t.text :description
      t.text :obs
      t.integer :qtd
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
