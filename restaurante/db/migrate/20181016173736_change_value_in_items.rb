class ChangeValueInItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :value, :decimal, :precision => 2, :scale => 2
  end
end
