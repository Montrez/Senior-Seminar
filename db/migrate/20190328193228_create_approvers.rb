class CreateApprovers < ActiveRecord::Migration[5.2]
  def change
    create_table :approvers do |t|
      t.string :name
      t.string :address
      t.references :estimated_expenses, foreign_key: true
      t.references :actual_expenses, foreign_key: true
      #t.string :department, default: " "
      
      t.timestamps
    end
  end
end
