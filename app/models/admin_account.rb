class AdminAccount < ApplicationRecord
	has_one :account, as: :accountable

end
