class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'MovieReviewApp')
  end

  def decode_token
    header = request.headers['Authorization']
    return unless header

    token = header.split(' ')[1]
    begin
      JWT.decode(token, 'MovieReviewApp')
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return unless decode_token

    user_id = decode_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authorized
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end
end
