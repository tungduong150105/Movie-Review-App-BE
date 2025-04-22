class UserMailer < ApplicationMailer
  def reset_password_email
    @user = params[:user]
    @token = params[:token]
    mail(to: @user.email, subject: 'Reset Password')
  end
end
