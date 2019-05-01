class ExpenseReportsController < ApplicationController
  before_action :set_expense_report, only: [:show, :edit, :update, :destroy]

  # GET /expense_reports
  # GET /expense_reports.json
  def pundit_user
    current_account
  end

  def index
    authorize ExpenseReport
    @expense_report = policy_scope(ExpenseReport)
    @expense_reports = ExpenseReport.all
    if !current_account.nil? 
      if current_account.accountable_type == 'Manager'
#        @manager_expense_reports = get_manager_reports
          @manager_expense_reports = ExpenseReport.all
      elsif current_account.accountable_type == 'Submitter'
        @submitter_expense_reports = get_submitter_reports
      else
        #do nothing
      end
    end

  end

  # GET /expense_reports/1
  # GET /expense_reports/1.json
  def show
    authorize @expense_report
  end

  # GET /expense_reports/new
  def new
    @trips = Trip.all
    @expense_report = ExpenseReport.new
    authorize @expense_report
     3.times do
       @expense_report.actual_expenses.build
     end
  end

  # GET /expense_reports/1/edit
  def edit
    authorize @expense_report
  end

  # POST /expense_reports
  # POST /expense_reports.json
  def create
    #not sure why this was here...?    @trips = Trip.all

    @expense_report = ExpenseReport.new(expense_report_params)
    authorize @expense_report
    @expense_report.submitter = current_account.accountable

    @expense_report.actual_expenses.each do |exp|
      exp.requests.each do |req|
        req.amount_from_total = req.percentrequested * exp.total
        req.destination = @expense_report.trip.destination
        req.expense_type = 'actual'
      end
    end


    respond_to do |format|
      if @expense_report.save
        format.html { redirect_to home_index_path, notice: 'Expense report was successfully created.' }
        format.json { render :show, status: :created, location: @expense_report }
      else
        format.html { render :new }
        format.json { render json: @expense_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_reports/1
  # PATCH/PUT /expense_reports/1.json
  def update
    authorize @expense_report


    @expense_report.actual_expenses.each do |exp|
      exp.requests.each do |req|
        req.amount_from_total = req.percentrequested * exp.total
        req.destination = @expense_report.trip.destination
        req.expense_type = 'actual'
      end
    end


    respond_to do |format|
      if @expense_report.update(expense_report_params)
        format.html { redirect_to @expense_report, notice: 'Expense report was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_report }
      else
        format.html { render :edit }
        format.json { render json: @expense_report.errors, status: :unprocessable_entity }
      end
    end
  end





  #approve status from views via the approve action
  respond_to :js

  def approve
    @expense_report = ExpenseReport.find(params[:id])
    if @expense_report.update(status: true)
      render
    else
      render @expense_report
    end
  end

  #disapprove status from views via the disapprove action
  respond_to :js

  def disapprove
    @expense_report = ExpenseReport.find(params[:id])
    if @expense_report.update(status: false)
      render
    else
      render @expense_report
    end
  end

  # DELETE /expense_reports/1
  # DELETE /expense_reports/1.json
  def destroy
    authorize @expense_report
    @expense_report.destroy
    respond_to do |format|
      format.html { redirect_to expense_reports_url, notice: 'Expense report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def get_manager_reports
    reports = Array.new
    ExpenseReport.all.each do |report|
      if report.managers_id == current_account.accountable.id
        reports.push(report)
      end
    end
    return reports
  end

  def get_submitter_reports
    reports = Array.new
    @expense_reports.each do |report|
      if report.submitter_id == current_account.accountable.id
        reports.push(report)
      end
    end
    return reports
  end


  def portal
    @expense_report = ExpenseReport.find(params[:id])
    @expense_reports = ExpenseReport.all
    @trip = @expense_report.trip
    if !current_account.nil? 
      if current_account.accountable_type == 'Manager'
        @manager_expense_reports = get_manager_reports
      elsif current_account.accountable_type == 'Submitter'
        @submitter_expense_reports = get_submitter_reports
      else
        #do nothing
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_report
      @expense_report = ExpenseReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_report_params
      params.require(:expense_report).permit(
        :id, :status, :trip_id, :actual_expenses_id, :submitter_id, :approvers_id, :managers_id, :comment,
        actual_expenses_attributes: [:id, :expense_type, :total, :requests_id, :status, :expense_report_id, :imageurl, :dateincurred, :_destroy, 
        requests_attributes: [:id, :department, :percentrequested, :status, :actual_expense_id, :estimated_expense_id, :_destroy]])
    end
end
