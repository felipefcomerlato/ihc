class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :card
      t.integer :option

      t.timestamps
    end
  end
end
