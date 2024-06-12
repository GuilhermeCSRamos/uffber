class DriversController < ApplicationController
  before_action :set_driver, only: %i[ show edit update destroy ]

  # GET /drivers or /drivers.json
  def index
    @drivers = Driver.all

    render json: @drivers
  end

  def show
    render json: @driver
  end

  # POST /drivers or /drivers.json
  def create
    @driver = Driver.create!(driver_params)

    render json: @driver, status: :created
  rescue
    render json: { error: 'failed to create driver' }, status: :bad_request
  end

  # PATCH/PUT /drivers/1 or /drivers/1.json
  def update
    @driver.update(driver_params)

    @driver.save

    render json: @driver, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /drivers/1 or /drivers/1.json
  def destroy
    @driver.destroy!

    render json: "destroyed", status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_driver
    @driver = Driver.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def driver_params
    params.require(:driver).permit(:id, :user_id, :cnh)
  end
end
