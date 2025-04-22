class PasswordReset
  include ActiveModel::Model

  attr_accessor :email

  def save
    @user = User.find_by(email: email)
    return unless @user

    @user.password_reset_token = (SecureRandom.random_number(9e5) + 1e5).to_i
    @user.password_reset_token_expires_at = Time.now + 15.minutes
    @user.save
    UserMailer.with(user: @user).reset_password_email.deliver_now
  end

  def self.find_by_valid_token(token)
    User.where('password_reset_token = ? AND password_reset_token_expires_at > ?', token, Time.now).first
  end
end
