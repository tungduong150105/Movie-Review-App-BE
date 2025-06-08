class ApplicationController < ActionController::API
  before_action :authenticate
  def encode_token(payload)
    JWT.encode(payload, 'moviereviewapp')
  end

  def decode_token
    header = request.headers['Authorization']
    if header
      token = header.split(' ')[1]
      begin
        JWT.decode(token, 'moviereviewapp')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authenticate
    unless !!current_user
      render json: {message: 'Please log in'}, status: :unauthorized
    end
  end
end
