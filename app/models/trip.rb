class Trip < ApplicationRecord
  paginates_per 10
  belongs_to :submitter, optional: true, dependent: :destroy
  has_one :expense_report
  has_many :approvers
  has_many :managers, dependent: :destroy
  has_many :estimated_expenses, dependent: :destroy
  has_many :requests, through: :estimated_expenses, dependent: :destroy
  accepts_nested_attributes_for :estimated_expenses, 
                                reject_if: :all_blank,
                                allow_destroy: true

  validates :purpose, :destination, :fromdate, :todate, :estimated_expenses, presence: true
end
