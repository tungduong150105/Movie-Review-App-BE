class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def login
    @user = User.find_by!(username: login_params[:username])
    if @user.authenticate(login_params[:password])
      @token = encode_token(user_id: @user.id)
      render json: {
        user: UserSerializer.new(@user),
        token: @token
      }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end

  def handle_record_not_found(errors)
    render json: { errors: errors.record.errors.full_message }, status: :unauthorized
  end
end
