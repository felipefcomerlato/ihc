class CreateEvaluates < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluates do |t|
      t.integer :value

      t.timestamps
    end
  end
end
