class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all

    render json: @comments
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.create!(comment_params)

    render json: @comment, status: :created
  rescue
    render json: { error: 'failed to create comment' }, status: :bad_request
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment.update!(comment_params)

    render json: @comment, status: :ok
  rescue
    render json: { error: 'error, try again' }, status: :bad_request
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    render json: "destroyed", status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:id, :lift_id, :user_id, :body)
  end
end
