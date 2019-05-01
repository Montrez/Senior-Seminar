class SubmitterPolicy
	attr_reader :current_account, :model

	def initialize(current_account, model)
		@current_account = current_account
		@submitter = model
	end
	
	def edit?
		@current_account == @submitter.account
	end

	def update?
		@current_account == @submitter.account
	end

end



