class AddPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, default: 5, null: false
  end
end
