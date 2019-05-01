class HomeController < ApplicationController
  def index
    @trips = Trip.all
    @requests = Request.all
    @request = Request.new #fixme
    @estimated_expenses = EstimatedExpense.all
    @actual_expenses = ActualExpense.all
    @expense_reports = ExpenseReport.all

    unless current_account.nil?


      if current_account.accountable_type == "Manager"
        @manager_trips_pending = Array.new
        @manager_trips_approved = Array.new
        @manager_reports_pending = Array.new
        @manager_reports_approved = Array.new

        @trips.each do |trip|
          if trip.managers_id == current_account.accountable.id
            if trip.status
              @manager_trips_approved.push(trip)
            else
              @manager_trips_pending.push(trip)
            end 
          end
        end

        @expense_reports.each do |report|
          if report.managers_id == current_account.accountable.id
            if report.status
              @manager_reports_approved.push(report)
            else
              @manager_reports_pending.push(report)
            end
          end
        end
      end



      if current_account.accountable_type == "Approver"
        @approver_expenses_pending = Array.new
        @approver_expenses_approved = Array.new
        @approver_requests_pending = Array.new
        @approver_requests_approved = Array.new

        @expenses = @actual_expenses + @estimated_expenses
        @expenses.each do |exp|
          exp.requests.each do |req|
            if req.department == current_account.accountable.department.department
              if req.status
                @approver_requests_approved.push(req)
              else
                @approver_requests_pending.push(req)
                @approver_expenses_pending.push(exp)
              end
              if all_requests_approved(exp)
                @approver_expenses_approved.push(exp)
              end
            end
          end
        end
        @approver_expenses_pending = @approver_expenses_pending.paginate(page: params[:page], per_page: 2)
        @approver_expenses_approved = @approver_expenses_approved.paginate(page: params[:page], per_page: 2)
        @approver_requests_pending = @approver_requests_pending.paginate(page: params[:page], per_page: 2)
        @approver_requests_approved = @approver_requests_approved.paginate(page: params[:page], per_page: 2)
      end



      if current_account.accountable_type == "Submitter"
        @submitter_trips_pending = Array.new
        @submitter_trips_approved = Array.new
        @submitter_reports_pending = Array.new
        @submitter_reports_approved = Array.new

        @trips.each do |trip|
          if trip.submitter_id == current_account.accountable.id
            if trip.status
              @submitter_trips_approved.push(trip)
            else
              @submitter_trips_pending.push(trip)
            end 
          end
        end

        @expense_reports.each do |report|
          if report.submitter_id == current_account.accountable.id
            if report.status
              @submitter_reports_approved.push(report)
            else
              @submitter_reports_pending.push(report)
            end
          end
        end

        
        unless current_account.accountable_type == 'AdminAccount'  
          #paginate lists
          @submitter_reports_approved = @submitter_reports_approved.sort().paginate(:page => params[:page], :per_page => 5)
          @submitter_reports_pending = @submitter_reports_pending.sort().paginate(:page => params[:page], :per_page => 5)
          @submitter_reports = @submitter_reports_pending + @submitter_reports_approved
          @submitter_reports = @submitter_reports.sort().paginate(:page => params[:page], :per_page => 5)
          @submitter_trips_approved = @submitter_trips_approved.sort().paginate(:page => params[:page], :per_page => 5)
          @submitter_trips_pending = @submitter_trips_pending.sort().paginate(:page => params[:page], :per_page => 5)
          @submitter_trips = @submitter_trips_pending + @submitter_trips_approved
          @submitter_trips = @submitter_trips.sort().paginate(:page => params[:page], :per_page => 5)
          #@trips = Trip.all.paginate(page: params[:page], per_page: 2) 
        end

      end


      if current_account.accountable_type == 'Submitter'
        @approvedtriplist = @submitter_trips_approved
        @pendingtriplist = @submitter_trips_pending
        @approvedreportlist = @submitter_reports_approved
        @pendingreportlist = @submitter_reports_pending
        @pendingexpenselist = Array.new #fixme
        @approvedexpenselist = Array.new #fixme
      elsif current_account.accountable_type == 'Manager'
        @approvedtriplist = @manager_trips_approved
        @pendingtriplist = @manager_trips_pending
        @approvedreportlist = @manager_reports_approved
        #@pendingreportlist = @manager_reports_pending
        @pendingreportlist = ExpenseReport.where(status: false)
        @pendingexpenselist = Array.new #fixme
        @approvedexpenselist = Array.new #fixme
      elsif current_account.accountable_type == 'Approver'
        @approvedtriplist = Array.new
        @pendingtriplist = Array.new
        @approvedreportlist = Array.new
        @pendingreportlist =Array.new
        @pendingexpenselist = @approver_expenses_pending #Array.new #fixme
        @approvedexpenselist = @approver_expenses_approved #Array.new #fixme 
      end

      unless current_account.accountable_type == 'AdminAccount'
        @approvedtriplist = @approvedtriplist.sort().paginate(:page => params[:page], :per_page => 5)
        @approvedreportlist = @approvedreportlist.sort().paginate(:page => params[:page], :per_page => 5)
        @pendingtriplist = @pendingtriplist.sort().paginate(:page => params[:page], :per_page => 5)
        @pendingreportlist = @pendingreportlist.sort().paginate(:page => params[:page], :per_page => 5)


        @pendingexpenselist = @pendingexpenselist.paginate(:page => params[:page], :per_page => 5)
        @approvedexpenselist = @approvedexpenselist.paginate(:page => params[:page], :per_page => 5)
      end


      if current_account.accountable_type == 'Approver'
        @expenses = @pendingexpenselist + @approvedexpenselist
        #@requests =  @approver_requests_pending +  @approver_requests_approved
        @requests = Request.where(department: current_account.accountable.department.department)
      end


    end #  user signed in block



    respond_to do |format|
      format.html {}
      format.json { render json: @requests }
    end

  end


  def data
  end


  def search
    requests = Request.where("department LIKE '%#{params[:query]}%'")
    render json: requests
  end


  private



  def sort_by
    %w(department
          percentrequested
          status).include?(params[:sort_by]) ? params[:sort_by] : 'status'
  end

  def order
    %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
  end

  def all_requests_approved(expense)
    expense.requests.each do |req|
      if req.status == false
        return false
      end
    end
    return true
  end

  def department_matches(req, dept)
    return req.department == dept
  end


  def trip_approved(trip)
    trip.estimated_expenses.each do |exp|
      exp.requests.each do |req|
        if req.status == false
          #exp.status = false
          return false
        end
        #exp.status = true
      end
    end
    return true
  end



  def report_approved(report)
    report.actual_expenses.each do |exp|
      exp.requests.each do |req|
        if req.status == false
          #exp.status = false
          return false
        end
        #exp.status = true
      end
    end
    return true
  end
end
