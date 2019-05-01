class ActualExpense < ApplicationRecord
  mount_uploader :imageurl, PictureUploader
  belongs_to :expense_report, optional: true
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :requests, reject_if: :all_blank, allow_destroy: true
  
  validates :dateincurred, :expense_type, :total, :requests, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0.01 }
end
