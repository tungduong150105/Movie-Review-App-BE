class Message < ApplicationRecord
  belongs_to :forum
  belongs_to :user

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast('MessagesChannel', {
                                   Message: BroadcastSerializer.new(self)
                                 })
  end
end
