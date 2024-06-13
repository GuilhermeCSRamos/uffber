class LiftsController < ApplicationController
  before_action :set_lift, only: %i[ show update ]

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
    if driver_params[:driver_id].present?
      @lift = Lift.create!(driver_params.merge(status: :active))

    elsif passenger_params[:passenger_id].present?
      @lift = Lift.create!(status: :pending)
      LiftPassenger.create!(passenger_params.merge(lift: @lift))
    end

    render json: @lift, status: :created
  rescue
    render json: { error: 'failed to create lift' }, status: :bad_request
  end

  # PATCH/PUT /lifts/1 or /lifts/1.json
  def update
    if driver_params[:driver_id].present?
      @lift.update!(driver_id: driver_params[:driver_id],
                    start_location: driver_params[:start_location],
                    end_location: driver_params[:end_location],
                    status: :active)

    elsif passenger_params[:passenger_id].present?
      LiftPassenger.create!(passenger_params.merge(lift: @lift))

    end

    render json: @lift, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /lifts/1 or /lifts/1.json
  # def destroy
  #   @lift.destroy!
  #
  #   render json: "destroyed", status: :ok
  # end

  def finish
    @lift.update(status: :ended)
  end

  def cancel
    @lift.update(status: :cancelled)
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

  def driver_params
    params.require(:lift).permit(:driver_id, :start_location, :end_location)
  end

  def passenger_params
    params.require(:lift).permit(:passenger_id, :pickup_location, :dropoff_location)
  end
end
# {
#   lift: { # create de um driver
#     driver_id: int,
#     start_location: string,
#     end_location: string
#   }
# }
#
# {
#   lift: { # create de um passenger
#     passenger_id: int,
#     pickup_location: string,
#     dropoff_location: string
#   }
# }
# {
#   lift: { # para update e destroy
#     id: int,
#     driver_id: int,
#     passenger_id: int,
#     start_location: string,
#     end_location: string,
#     pickup_location: string,
#     dropoff_location: string
#   }
# }