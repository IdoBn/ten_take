class CreateHandOffs < ActiveRecord::Migration
  def change
    create_table :hand_offs do |t|
      t.integer :status
      t.integer :borrow_id

      t.timestamps null: false
    end
  end
end
