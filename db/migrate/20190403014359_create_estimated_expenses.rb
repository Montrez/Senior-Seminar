class CreateEstimatedExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :estimated_expenses do |t|
      t.string :expense_type
      t.float :total
      t.references :requests, foreign_key: true
      t.references :trip, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
