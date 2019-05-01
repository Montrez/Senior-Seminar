class EstimatedExpense < ApplicationRecord
  paginates_per 10
  belongs_to :trip, optional: true
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :requests, reject_if: :all_blank, allow_destroy: true

  validates :expense_type, :total, :requests, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0.01 }
  # validate :ensure_requests_dont_exceed_expense

  # def ensure_requests_dont_exceed_expense
  #   if self.requests.sum.all(:percentrequested) > 1
  #     errors.add(:base, 'Requests are exceeding expense.')
  #   end
  # end

end
