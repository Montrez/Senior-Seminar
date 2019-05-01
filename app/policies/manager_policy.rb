class ManagerPolicy
	attr_reader :current_account, :model

	def initialize(current_account, model)
		@current_account = current_account
		@manager = model
	end

	def edit?
		@current_account == manager.account
	end

	def update?
		@current_account == manager.account
	end
end



