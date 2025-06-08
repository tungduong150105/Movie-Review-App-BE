class UsersController < ApplicationController
  skip_before_action :authenticate, only: %i[create]
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
      user: UserSerializer.new(user),
      token: @token
    }, status: :created
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end

  def handle_invalid_record(exception)
    render json: { errors: exception.record.errors.full_message }, status: :bad_request
  end
end
