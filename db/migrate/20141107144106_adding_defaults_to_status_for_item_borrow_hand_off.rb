class AddingDefaultsToStatusForItemBorrowHandOff < ActiveRecord::Migration
  def change
  	change_column_null :items, :status, false
		change_column_default :items, :status, "free"

		change_column_null :borrows, :status, false
		change_column_default :borrows, :status, "want"

		change_column_null :hand_offs, :status, false
		change_column_default :hand_offs, :status, 1
  end
end
