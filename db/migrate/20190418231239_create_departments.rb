class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :department
      t.float :budget, precision: 8, scale: 2

      t.timestamps
    end
  end
end
