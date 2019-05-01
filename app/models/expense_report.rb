class ExpenseReport < ApplicationRecord
  belongs_to :submitter, required: false
  belongs_to :trip, required: false
  has_many :approvers
  has_many :managers
  has_many :actual_expenses, dependent: :destroy
  has_many :requests, through: :actual_expenses, dependent: :destroy
  accepts_nested_attributes_for :actual_expenses, reject_if: :all_blank, allow_destroy: true
  validates :actual_expenses, presence: true

end
