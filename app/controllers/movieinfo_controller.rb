class MovieinfoController < ApplicationController
  before_action :authenticate

  def create
    @movieinfo = Movieinfor.new(movieinfo_params)
    if @movieinfo.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def find
    @movieinfo = Movieinfor.where(type_name: params[:type_name], _id: params[:_id])
    if @movieinfo
      render json: { message: 'success', movieinfos: @movieinfo }, status: :ok
    else
      render json: { message: 'Error' }, status: :not_found
    end
  end

  private

  def movieinfo_params
    params.permit(:type_name, :_id, :name, :img_url, :release_day, :rating)
  end
end
