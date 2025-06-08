class RecentController < ApplicationController
  before_action :authenticate

  def list
    @recent = Recent.where(user_id: current_user.id)
    render json: { message: 'success', recent: @recent }, status: :ok
  end

  def create
    @have = Recent.find_by(user_id: current_user.id, _id: params[:_id])
    @recent = Recent.new(recent_params)
    @recent.user_id = current_user.id
    if @have
      render json: { message: 'Already have' }, status: :conflict
    elsif @recent.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  private

  def recent_params
    params.permit(:type_name, :_id)
  end
end
