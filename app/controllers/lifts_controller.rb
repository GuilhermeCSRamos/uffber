class LiftsController < ApplicationController
  before_action :set_lift, only: %i[ show update ]

  # GET /lifts or /lifts.json
  # def index
  #   if driver_params?[:driver]
  #     @lifts = Lift.pending
  #   else
  #     @lifts = Lift.active
  #   end
  #
  #   render json: @lifts
  # end

  def driver_index
    @lifts = Lift.pending

    @lifts = @lifts.map do |lift|
      lift_attributes = lift.attributes

      lift_attributes["waypoints"] = lift.lift_passenger.map do |each|
        {
          pickup_location: each.pickup_location,
          dropoff_location: each.dropoff_location
        }

      end

      lift_attributes
    end

    render json: @lifts
  end

  def passenger_index
    @lifts = Lift.active

    render json: @lifts
  end

  # GET /lifts/1 or /lifts/1.json
  def show
    render json: { lift: @lift, waypoints: @lift.lift_passenger.map do |each|
      {
        pickup_location: each.pickup_location,
        dropoff_location: each.dropoff_location
      }
    end
    }
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
      @driver = Driver.find_by(id: driver_params[:driver_id])

      return render json: { error: 'driver already in a lift'}, status: :ok unless @driver.lifts.active.empty?

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

  def driver_params?
    params.require(:lift).permit(:driver)
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