class WatchlistController < ApplicationController
  before_action :authenticate

  def count
    @watchlist_count = Watchlist.where(user_id: current_user.id).count
    render json: { message: 'success', watchlist_count: @watchlist_count }, status: :ok
  end

  def create
    @have = Watchlist.find_by(user_id: current_user.id, _id: params[:_id], type_name: params[:type_name])
    @watchlist = Watchlist.new(watchlist_params)
    @watchlist.user_id = current_user.id
    if @have
      render json: { message: 'Already have' }, status: :conflict
    elsif @watchlist.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error', have: @have }, status: :unauthorized
    end
  end

  def is_in_watchlist
    @watchlist = Watchlist.find_by(user_id: current_user.id, type_name: params[:type_name], _id: params[:_id])
    if @watchlist
      render json: { message: 'Success' }, status: :ok
    else
      render json: { message: 'Not found' }, status: :not_found
    end
  end

  def list
    list = Watchlist.where(user_id: current_user.id)
    render json: { message: 'success', watchlist: ActiveModel::Serializer::ArraySerializer.new(list, each_serializer: WatchlistSerializer) },
           status: :ok
  end

  def delete
    @watchlist = Watchlist.find_by(user_id: current_user.id, type_name: params[:type_name], _id: params[:_id])
    if @watchlist
      if @watchlist.delete
        render json: { message: 'Succes' }, status: :ok
      else
        render json: { message: 'Error' }, status: :unauthorized
      end
    else
      render json: { message: 'Not found' }, status: :not_found
    end
  end

  private

  def watchlist_params
    params.permit(:type_name, :_id)
  end
end
