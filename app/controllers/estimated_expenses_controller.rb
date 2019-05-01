class EstimatedExpensesController < ApplicationController
  before_action :set_estimated_expense, only: [:show, :edit, :update, :destroy]

  # GET /estimated_expenses
  # GET /estimated_expenses.json
  def pundit_user
    current_account
  end
  
  def index
    @estimated_expenses = EstimatedExpense.all
  end

  # GET /estimated_expenses/1
  # GET /estimated_expenses/1.json
  def show
  end

  # GET /estimated_expenses/new
  def new
    @estimated_expense = EstimatedExpense.new
    @estimated_expense.requests.build
  end

  # GET /estimated_expenses/1/edit
  def edit
  end

  # POST /estimated_expenses
  # POST /estimated_expenses.json
  def create
    @estimated_expense = EstimatedExpense.new(estimated_expense_params)

    respond_to do |format|
      if @estimated_expense.save
        format.html { redirect_to @estimated_expense, notice: 'Estimated expense was successfully created.' }
        format.json { render :show, status: :created, location: @estimated_expense }
      else
        format.html { render :new }
        format.json { render json: @estimated_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimated_expenses/1
  # PATCH/PUT /estimated_expenses/1.json
  def update
    respond_to do |format|
      if @estimated_expense.update(estimated_expense_params)
        format.html { redirect_to @estimated_expense, notice: 'Estimated expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @estimated_expense }
      else
        format.html { render :edit }
        format.json { render json: @estimated_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimated_expenses/1
  # DELETE /estimated_expenses/1.json
  def destroy
    @estimated_expense.destroy
    respond_to do |format|
      format.html { redirect_to estimated_expenses_url, notice: 'Estimated expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #approve status in view via the approve method
  respond_to :js

  def approve
    @estimated_expense = EstimatedExpense.find(params[:id])
    if @estimated_expense.update(status: true)
      render
    else
      render @estimated_expense
    end
  end


  #disapprove status in view via the approve method
  respond_to :js

  def disapprove
    @estimated_expense = EstimatedExpense.find(params[:id])
    if @estimated_expense.update(status: false)
      render
    else
      render @estimated_expense
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimated_expense
      @estimated_expense = EstimatedExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimated_expense_params
      params.require(:estimated_expense).permit(
          :id, :expense_type, :total, :status, :trip_id, :requests_id,
          requests_attributes: [:id, :department, :percentrequested, :status, :estimated_expense_id, :_destroy])
    end
end
