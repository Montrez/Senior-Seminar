class AddTotalDestinationAndTypeToRequest < ActiveRecord::Migration[5.2]
  def change
  	add_column :requests, :amount_from_total, :float
  	add_column :requests, :destination, :string
  	add_column :requests, :expense_type, :text
  end
end
