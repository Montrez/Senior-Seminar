class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    #@requests = Request.all
    #@request = Request.new
    @requests = Request.where(department: current_account.accountable.department.department)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.new
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request = Request.find(params[:id])
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  respond_to :js

  def approve
    @request = Request.find(params[:id]) #fixme

    if @request.update(status: true)
      render 
    else
      render @request
    end
  end


  #disapprove status in view via the disapprove action


  # respond_to :js
  
  @clicked = false

  def disapprove
    if current_account.accountable_type == 'Approver'
      @request = Request.find(params[:id])
      @budget = Department.find_by(department: @request.department).budget
      @requests = Request.where(department: current_account.accountable.department.department)
      logger.error "\n\n\treq status was #{@request.status}\n\n"
      if @request.status
        toggle =  @request.update(status: false)
        if @clicked
          @budget = @budget + @request.amount_from_total
        end
      else 
        toggle = @request.update(status: true)
        @budget = @budget - @request.amount_from_total
      end
        @clicked = true
      logger.error "\n\n\treq status after update is #{@request.status}\n\n"

      respond_to do |format|

        format.html{}

        format.json{ }

        format.js { }
      end
    else
      @request = Request.find(params[:id])
      if @request.update(status: false)
        render
      else
        render @request
      end
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:id, :department, :percentrequested, :status, :estimated_expense_id, :actualexpense_id)
  end
end
