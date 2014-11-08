class AddImageToItems < ActiveRecord::Migration
  def change
    add_column :items, :image, :string, nil: false
  end
end
