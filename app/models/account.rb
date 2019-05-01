class Account < ApplicationRecord
  belongs_to :accountable, polymorphic: true
  has_one :account, as: :accountable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ACCOUNT_TYPES=["Admin", "Submitter", "Approver", "Manager"]
    attr_accessor :type
end
