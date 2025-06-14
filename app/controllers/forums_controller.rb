class ForumsController < ApplicationController
  before_action :authenticate
  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def find
    @forum = Forum.find_by(movie_id: params[:forum_id])
    if @forum
      render json: { message: 'success' }, status: :ok
    else
      render json: { message: 'Error' }, status: :not_found
    end
  end

  private

  def forum_params
    params.permit(:movie_id)
  end
end
