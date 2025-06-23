class RatingSerializer < ActiveModel::Serializer
  attributes :_id, :type_name, :detail, :rating
  def detail
    @movieinfor = Movieinfor.find_by(_id: object._id, type_name: object.type_name)
  end

  def rating
    @rating = Rating.find_by(user_id: object.user_id, _id: object._id, type_name: object.type_name)
    if @rating
      @rating.rating
    else
      0
    end
  end
end
