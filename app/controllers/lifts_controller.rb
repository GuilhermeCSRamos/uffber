class LiftsController < ApplicationController
  before_action :set_lift, only: %i[ show update destroy ]

  # GET /lifts or /lifts.json
  def index
    @lifts = Lift.all

    render json: @lifts
  end

  # GET /lifts/1 or /lifts/1.json
  def show
    render json: @lift
  end

  # POST /lifts or /lifts.json
  def create
    if lift_params[:driver_id].present?
      @lift = Lift.create!(lift_params)

    elsif lift_params[:passenger_id].present?
      @lift = Lift.create!(lift_params.except(:dropoff_location, :pickup_location, :passenger_id))
      LiftPassenger.create!(lift_params.merge(lift: @lift).except(:status))
    end

    render json: @lift, status: :created
  rescue
    render json: { error: 'failed to create lift' }, status: :bad_request
  end

  # PATCH/PUT /lifts/1 or /lifts/1.json
  def update
    if lift_params[:driver_id].present?
      @lift.driver_id = lift_params[:driver_id]
      @lift.start_location = lift_params[:start_location]
      @lift.end_location = lift_params[:end_location]

    elsif lift_params[:passenger_id].present?
      LiftPassenger.create!(lift_params.merge(lift: @lift).except(:status))

    end
    @lift.save

    render json: @lift, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /lifts/1 or /lifts/1.json
  def destroy
    @lift.destroy!

    render json: "destroyed", status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lift
    @lift = Lift.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lift_params
    # {lift: {driver_id: int, passenger_id: int, status: int, start_location: string, end_location: string}}
    params.require(:lift).permit(:id, :driver_id, :passenger_id, :status, :start_location, :end_location, :pickup_location, :dropoff_location)
  end
end
