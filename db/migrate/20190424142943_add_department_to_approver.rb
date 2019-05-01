class AddDepartmentToApprover < ActiveRecord::Migration[5.2]
  def change
  	add_reference :approvers, :department, foreign_key: true
  end
end
