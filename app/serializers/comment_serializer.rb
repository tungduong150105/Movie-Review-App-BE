class CommentSerializer < ActiveModel::Serializer
  attributes :body, :username, :rating, :date
  def username
    @user = User.find_by(id: object.user_id)
    @user[:username] unless @user.nil?
  end

  def rating
    @rating = Rating.find_by(user_id: object.user_id, _id: object._id)
    if @rating
      @rating.rating
    else
      0
    end
  end

  def date
    object.created_at.strftime('%b %d,%Y')
  end
end
