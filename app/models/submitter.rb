class Submitter < ApplicationRecord
  has_one :account, as: :accountable
  has_many :trips, dependent: :destroy
end
