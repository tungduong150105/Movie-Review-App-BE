class MessagesController < ApplicationController
  before_action :authenticate
  def create
    @message = Message.new(message_params)
    @message.forum_id = find_forum
    @message.user_id = current_user.id
    if @message.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def find
    @message = Message.where(forum_id: find_forum)
    render json: {
      messages: ActiveModel::Serializer::ArraySerializer.new(@message, each_serializer: MessageSerializer)
    }, status: :ok
  end

  private

  def message_params
    params.permit(:message)
  end

  def find_forum
    @forum = Forum.find_by(movie_id: params[:movie_id])
    if @forum
      @forum.id
    else
      @forum = Forum.new(movie_id: params[:movie_id])
      @forum.save
      @forum.id
    end
  end
end
