class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]




  # GET /trips
  # GET /trips.json
  def pundit_user
    current_account
  end
  
  def index
    #authorize Trip
    @trips = Trip.all
    @trip = policy_scope(Trip)
    if !current_account.nil? 
      if current_account.accountable_type == 'Manager'
        @manager_trips = get_manager_trips
      elsif current_account.accountable_type == 'Submitter'
        @submitter_trips = get_submitter_trips
      else
        #do nothing
      end
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    authorize @trip
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    authorize @trip
    3.times do
      @trip.estimated_expenses.build
    end

  end

  # GET /trips/1/edit
  def edit
    authorize @trip
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    @trip.submitter = current_account.accountable


    @trip.estimated_expenses.each do |exp|
      exp.requests.each do |req|
        req.amount_from_total = req.percentrequested * exp.total
        req.destination = @trip.destination
        req.expense_type = 'estimated'
      end
    end

    respond_to do |format|
      if @trip.save
        format.html { redirect_to home_index_path, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    authorize @trip


    @trip.estimated_expenses.each do |exp|
      exp.requests.each do |req|
        req.amount_from_total = req.percentrequested * exp.total
        req.destination = @trip.destination
        req.expense_type = 'estimated'
      end
    end

    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    authorize @trip
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #approve status from views via the approve action
  respond_to :js

  def approve
    @trip = Trip.find(params[:id])
    if @trip.update(status: true)
      render
    else
      render @trip
    end
  end

  #disapprove status from views via the disapprove action
  respond_to :js

  def disapprove
    @trip = Trip.find(params[:id])
    if @trip.update(status: false)
      render
    else
      render @trip
    end
  end

  def get_manager_trips
    trips = Array.new
    @trips.each do |trip|
      if trip.managers_id == current_account.accountable.id
        trips.push(trip)
      end
    end
    return trips
  end

  def get_submitter_trips
    trips = Array.new
    @trips.each do |trip|
      if trip.submitter_id == current_account.accountable.id
        trips.push(trip)
      end
    end
    return trips
  end


  def portal
    @trip = Trip.find(params[:id])
    @trips = Trip.all
    if !current_account.nil? 
      if current_account.accountable_type == 'Manager'
        @manager_trips = get_manager_trips
      elsif current_account.accountable_type == 'Submitter'
        @submitter_trips = get_submitter_trips
      else
        #do nothing
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      #params.require(:trip).permit(:estimated_expense_id, :destination, :purpose, :todate, :fromdate)
      params.require(:trip).permit(
          :id, :destination, :purpose, :todate, :fromdate, :estimated_expense_id, :managers_id, :submitter_id, :approvers_id, :status, :comment,
          estimated_expenses_attributes: [:id, :expense_type, :total, :request_id, :status, :trips_id, :_destroy, 
          requests_attributes: [:id, :department, :percentrequested, :status, :estimated_expense_id, :_destroy]])
    end
end
