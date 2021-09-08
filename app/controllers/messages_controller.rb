class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      flash.now[:success] = 'Message sent'
      ActionCable.server.broadcast("chatroom_channel", render_message(message))
    end
  end
  private
  def message_params
    params.require(:message).permit(:body)
  end
  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
