class CreateSubmitters < ActiveRecord::Migration[5.2]
  def change
    create_table :submitters do |t|
      t.string :name
      t.string :address
      t.references :trips, foreign_key: true
      t.references :expense_reports, foreign_key: true
      t.timestamps
    end
  end
end
