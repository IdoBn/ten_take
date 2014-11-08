class AddNameToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string, nil: false
  end
end
