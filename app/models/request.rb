class Request < ApplicationRecord
  belongs_to :estimated_expense, optional: true
  belongs_to :actual_expense, optional: true

  validates :department, :percentrequested, presence: true
  validates :percentrequested, numericality: { greater_than: 0, lesser_than_or_equal_to: 1 }
end
