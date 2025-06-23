class CommentController < ApplicationController
  before_action :authenticate

  def get
    @comment = Comment.where(type_name: params[:type_name], _id: params[:_id])
    render json: {
      message: 'success',
      comments: ActiveModel::Serializer::ArraySerializer.new(@comment, each_serializer: CommentSerializer)
    }, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  private

  def comment_params
    params.permit(:type_name, :_id, :body)
  end
end
