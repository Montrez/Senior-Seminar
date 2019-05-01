class AddApproverToTrip < ActiveRecord::Migration[5.2]
  def change
  	add_reference :trips, :approvers, foreign_key: true
  end
end
