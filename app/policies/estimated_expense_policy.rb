class EstimatedExpensePolicy
  attr_reader :current_account, :model
  def initialize(current_account, model)
    @current_account = current_account
    @estimated_expense = model
  end

end
