class PasswordresetController < ApplicationController
  skip_before_action :authorized, only: %i[new create check update]
  def new
    @password_reset = PasswordReset.new
  end

  def create
    @password_reset = PasswordReset.new(email_params)
    @password_reset.save

    render json: { message: 'Email sent' }, status: :created
  end

  def check
    @user = PasswordReset.find_by_valid_token(params[:token])
    if @user
      render json: { message: 'Continue to reset your password' }, status: :ok
    else
      render json: { message: 'Invalid token' }, status: :unauthorized
    end
  end

  def update
    @user = PasswordReset.find_by_valid_token(params[:token])
    return unless @user

    if @user.update(password_reset_params)
      render json: { message: 'Password reset successful' }, status: :ok
    else
      render json: { message: 'Password reset failed' }, status: :unauthorized
    end
  end

  private

  def email_params
    params.permit(:email)
  end

  def password_reset_params
    params.permit(:password)
  end
end
