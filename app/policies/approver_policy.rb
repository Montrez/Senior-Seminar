class ApproverPolicy
	attr_reader :current_account, :model

	def initialize(current_account, model)
		@current_account = current_account
		@approver = model
	end

	def edit?
		@current_account == @approver.account
	end

	def update?
		@current_account == @approver.account
	end
end



