class ActualExpensePolicy
  attr_reader :current_account, :model
  def initialize(current_account, model)
    @current_account = current_account
    @actual_expense = model
  end
end
