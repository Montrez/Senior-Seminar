class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :department
      t.float :percentrequested
      t.boolean :status, default: false
      t.references :estimated_expense, foreign_key: true
      t.references :actual_expense, foreign_key: true
      t.timestamps
    end
  end
end
