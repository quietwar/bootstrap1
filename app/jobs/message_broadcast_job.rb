class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms_#{message.chatroom.id}_channel",
                                 message: 'MESSAGE_HTML'
  end

  private

 def render_message(message)
   MessagesController.render partial: 'messages/message', locals: {message: message}
 end
end
