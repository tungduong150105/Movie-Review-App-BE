class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[create]
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
      user: UserSerializer.new(user),
      token: @token
    }, status: :created
  end

  def me
    render json: current_user, status: :ok
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end

  def handle_invalid_record(errors)
    render json: { errors: errors.record.errors.full_message }, status: :unprocessable_entity
  end
end
