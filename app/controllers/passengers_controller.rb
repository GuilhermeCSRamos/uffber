class PassengersController < ApplicationController

  def actual_lift
    @passenger = Passenger.find(params[:passenger_id].to_i)

    render json: @passenger.lift.active.first
  end
end