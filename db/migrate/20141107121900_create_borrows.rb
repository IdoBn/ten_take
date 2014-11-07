class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.integer :borrower_id
      t.integer :item_id
      t.string :status
      t.datetime :should_be_returned_at

      t.timestamps null: false
    end
  end
end
