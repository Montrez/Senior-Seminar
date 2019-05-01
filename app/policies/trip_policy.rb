class TripPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @trip = model
  end
  def index?
  	if(@current_account)
  		current_account.accountable_type == "Submitter"
  	else
  		false
  	end
  end
  def new?
  	if(@current_account)
    current_account.accountable_type == "Submitter"
	else
		false
	end
  end
  def create?
    current_account.accountable_type == "Submitter"
  end
  def show?
    @current_account == @trip.submitter.account || current_account.accountable_type == "Manager" || current_account.accountable_type == "Approver"
  end
   def edit?
    @current_account == @trip.submitter.account || current_account.accountable_type == "Manager" || current_account.accountable_type == "Approver"
  end

  def update?
    @current_account == @trip.submitter.account || current_account.accountable_type == "Manager" || current_account.accountable_type == "Approver"
  end

  def destroy?
    @current_account == @trip.submitter.account || @current_account.accountable_type == "Manager" || current_account.accountable_type == "Approver"
  end

   class Scope < Struct.new(:current_account, :model)
    def resolve
        model.where(submitter: current_account.accountable)
    end
  end
end
