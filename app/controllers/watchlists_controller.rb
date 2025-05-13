class WatchlistsController < ApplicationController
  def create
    @watchlist = Watchlist.new(watchlist_params)
    @watchlist.user_id = current_user
    if @watchlist.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def list
    @user = User.find_by(id: current_user)
    return unless @user

    list = Watchlist.where(user_id: @user.id)
    render json: list, status: :ok
  end

  private

  def watchlist_params
    params.permit(:movie_id)
  end
end
