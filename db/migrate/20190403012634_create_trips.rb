class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :estimated_expenses, foreign_key: true
      t.references :managers, foreign_key: true
      t.references :submitter, foreign_key: true
      t.string :destination
      t.text :purpose
      t.date :todate
      t.date :fromdate

      t.timestamps
    end
  end
end
