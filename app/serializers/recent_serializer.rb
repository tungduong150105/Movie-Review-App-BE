class RecentSerializer < ActiveModel::Serializer
  attributes :type_name, :_id, :detail

  def detail
    @movieinfor = Movieinfor.find_by(_id: object._id, type_name: object.type_name)
  end
end
