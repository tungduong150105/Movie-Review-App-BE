class MessageSerializer < ActiveModel::Serializer
  attributes :message, :username
  def username
    @user = User.find_by(id: object.user_id)
    @user[:username] unless @user.nil?
  end
end
