class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.forum_id = find_forum
    @message.user_id = find_user
    if @message.save
      render json: { message: 'Success' }, status: :created
    else
      render json: { message: 'Error' }, status: :unauthorized
    end
  end

  def find
    @message = Message.where(forum_id: find_forum, user_id: find_user)
    render json: {
      Message: @message
    }, status: :ok
  end

  private

  def message_params
    params.permit(:message)
  end

  def find_forum
    @forum = Forum.find_by(movie_id: params[:movie_id])
    @forum.id
  end

  def find_user
    @user = User.find_by(username: params[:username])
    @user.id
  end
end
