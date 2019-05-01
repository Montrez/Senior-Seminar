class CreateActualExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :actual_expenses do |t|
      t.string :expense_type
      t.float :total
      t.references :requests, foreign_key: true
      t.references :expense_report, foreign_key: true
      t.boolean :status, default: false
      t.date :dateincurred
      t.string :imageurl

      t.timestamps
    end
  end
end
