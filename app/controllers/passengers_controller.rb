class PassengersController < ApplicationController
  before_action :set_passenger, only: %i[ show edit update destroy ]

  # GET /passengers or /passengers.json
  def index
    @passengers = Passenger.all

    render json: @passengers
  end

  def show
    render json: @passenger
  end

  # POST /passengers or /passengers.json
  def create
    @passenger = Passenger.create!(passenger_params)

    render json: @passenger, status: :created
  rescue
    render json: { error: 'failed to create passenger' }, status: :bad_request
  end

  # PATCH/PUT /passengers/1 or /passengers/1.json
  def update
    @passenger.update(passenger_params)

    @passenger.save

    render json: @passenger, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /passengers/1 or /passengers/1.json
  def destroy
    @passenger.destroy!

    render json: "destroyed", status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def passenger_params
    params.require(:passenger).permit(:id, :user_id)
  end
end