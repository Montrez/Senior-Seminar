class AddCommentsToTables < ActiveRecord::Migration[5.2]
  def change
  	add_column :trips, :comment, :text
  	add_column :expense_reports, :comment, :text
  	add_column :estimated_expenses, :comment, :text
  	add_column :actual_expenses, :comment, :text
  	add_column :requests, :comment, :text
  end
end
