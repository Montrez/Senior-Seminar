class CreateExpenseReports < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_reports do |t|
      t.references :actual_expenses, foreign_key: true
      t.references :trip, foreign_key: true
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
