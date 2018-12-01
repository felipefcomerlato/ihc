class AlterValueTypeInItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :value, :decimal, :precision => 8, :scale => 4
  end
end
