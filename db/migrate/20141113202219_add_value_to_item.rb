class AddValueToItem < ActiveRecord::Migration
  def change
    add_column :items, :value, :integer, null: false, default: 0
  end
end
