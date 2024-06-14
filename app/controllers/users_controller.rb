class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  # POST /users or /users.json
  def create
    @user = User.create!(user_params)

    render json: @user, status: :created
  rescue
    render json: { error: 'failed to create user' }, status: :bad_request
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user.update(user_params)

    @user.save

    render json: @user, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    render json: "destroyed", status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:id, :name, :iduff)
  end
end