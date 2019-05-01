class ActualExpensesController < ApplicationController
  before_action :set_actual_expense, only: [:show, :edit, :update, :destroy]

  # GET /actual_expenses
  # GET /actual_expenses.json
  def index
    @actual_expenses = ActualExpense.all
  end

  # GET /actual_expenses/1
  # GET /actual_expenses/1.json
  def show
  end

  # GET /actual_expenses/new
  def new
    @actual_expense = ActualExpense.new
  end

  # GET /actual_expenses/1/edit
  def edit
  end

  # POST /actual_expenses
  # POST /actual_expenses.json
  def create
    @actual_expense = ActualExpense.new(actual_expense_params)

    respond_to do |format|
      if @actual_expense.save
        format.html { redirect_to @actual_expense, notice: 'Actual expense was successfully created.' }
        format.json { render :show, status: :created, location: @actual_expense }
      else
        format.html { render :new }
        format.json { render json: @actual_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actual_expenses/1
  # PATCH/PUT /actual_expenses/1.json
  def update
    respond_to do |format|
      if @actual_expense.update(actual_expense_params)
        format.html { redirect_to @actual_expense, notice: 'Actual expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @actual_expense }
      else
        format.html { render :edit }
        format.json { render json: @actual_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actual_expenses/1
  # DELETE /actual_expenses/1.json
  def destroy
    @actual_expense.destroy
    respond_to do |format|
      format.html { redirect_to actual_expenses_url, notice: 'Actual expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #approve status in view via the approve method
  respond_to :js

  def approve
    @actual_expense = ActualExpense.find(params[:id])
    if @actual_expense.update(status: true)
      render
    else
      render @actual_expense
    end
  end


  #disapprove status in view via the approve method
  respond_to :js

  def disapprove
    @actual_expense = ActualExpense.find(params[:id])
    if @actual_expense.update(status: false)
      render
    else
      render @actual_expense
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actual_expense
      @actual_expense = ActualExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actual_expense_params
      params.require(:actual_expense).permit(
          :id, :expense_type, :total, :requets_id, :status, :dateincurred, :imageurl, 
          requests_attributes: [:id, :department, :percentrequested, :status, :actual_expense_id, :estimated_espense_id, :_destroy])
    end
end
