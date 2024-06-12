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
    @lift = Lift.new(lift_params)
    respond_to do |format|
      if @lift.save
        format.html { redirect_to lift_url(@lift), notice: "Lift was successfully created." }
        format.json { render :show, status: :created, location: @lift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lifts/1 or /lifts/1.json
  def update
    respond_to do |format|
      if @lift.update(lift_params)
        format.html { redirect_to lift_url(@lift), notice: "Lift was successfully updated." }
        format.json { render :show, status: :ok, location: @lift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifts/1 or /lifts/1.json
  def destroy
    @lift.destroy!

    respond_to do |format|
      format.html { redirect_to lifts_url, notice: "Lift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lift
      @lift = Lift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lift_params
      # {lift: {driver_id: int, passenger_id: int, status: int, start_location: string, end_location: string}}
      params.permit(:driver_id, :passenger_id, :status, :start_location, :end_location)
    end
end
