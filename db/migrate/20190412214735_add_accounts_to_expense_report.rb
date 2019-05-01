class AddAccountsToExpenseReport < ActiveRecord::Migration[5.2]
  def change
  	add_reference :expense_reports, :submitter, foreign_key: true
  	add_reference :expense_reports, :approvers, foreign_key: true
  	add_reference :expense_reports, :managers, foreign_key: true
  end
end
