class DriversController < ApplicationController

  def actual_lift
    @driver = Driver.find(params[:driver_id].to_i)

    render json: @driver.lifts.active.first
  end
end
