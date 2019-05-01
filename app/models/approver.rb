class Approver < ApplicationRecord
  has_one :account, as: :accountable
  has_many :expense_reports
  belongs_to :department
end
