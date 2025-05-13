class MessageSerializer < ActiveModel::Serializer
  attributes :message, :user_id
end
