class RatingController < ApplicationController
  before_action :authenticate

  def list
    @rating = Rating.where(user_id: current_user.id)
    render json: { message: 'success', rating: ActiveModel::Serializer::ArraySerializer.new(@rating, each_serializer: RatingSerializer) },
           status: :ok
  end

  def get
    @rating = Rating.find_by(type_name: params[:type_name], _id: params[:_id], user_id: current_user.id)
    if @rating
      render json: { message: 'success', rating: @rating }, status: :ok
    else
      render json: { message: 'Rating not found' }, status: :not_found
    end
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    if @rating.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def update
    @rating = Rating.find_by(user_id: current_user.id, type_name: params[:type_name], _id: params[:_id])
    if @rating
      @rating.rating = params[:rating]
      if @rating.save
        render json: { message: 'Success' }, status: :ok
      else
        render json: { message: 'Error' }, status: :unauthorized
      end
    else
      render json: { message: 'Rating not found' }, status: :not_found
    end
  end

  private

  def rating_params
    params.permit(:type_name, :_id, :rating)
  end
end
