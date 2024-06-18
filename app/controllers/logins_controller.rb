class LoginsController < ApplicationController
  # POST /logins or /logins.json
  def create
    @login = User.find_by!(iduff: login_params[:iduff])

    return render json: { error: 'wrong password'} unless @login.password == login_params[:password]

    @driver = Driver.find_by!(user_id: @login.id) if login_params[:driver]
    @passenger = Passenger.find_by!(user_id: @login.id) unless login_params[:driver]

    render json: { user_id: @login&.id, driver_id: @driver&.id, passenger_id: @passenger&.id }, status: :ok
  rescue
    render json: { error: 'failed to login' }, status: :bad_request
  end

  private

  # Only allow a list of trusted parameters through.
  def login_params
    params.require(:login).permit(:iduff, :password, :driver)
  end
end
