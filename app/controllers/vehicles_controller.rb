class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ edit update destroy ]

  def show_by_driver
    @vehicle = Vehicle.find_by_driver_id(vehicle_params[:driver_id])

    render json: @vehicle
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.create!(vehicle_params)

    render json: @vehicle, status: :created
  rescue
    render json: { error: 'failed to create vehicle' }, status: :bad_request
  end

  def update
    @vehicle.update(vehicle_params)

    @vehicle.save

    render json: @vehicle, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy!

    render json: "destroyed", status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.require(:vehicle).permit(:id, :driver_id, :model, :color, :license_plate, :capacity, :kind)
  end
end