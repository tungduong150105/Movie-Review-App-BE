class ForumsController < ApplicationController
  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  private

  def forum_params
    params.permit(:movie_id)
  end
end
