class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)

    respond_to do |format|
      if message.save
        ActionCable.server.broadcast 'chat_room_channel',
          message: render_message(message)

        format.js
      else
        flash.now[:negative] = 'Message not sent'
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    render_to_string partial: 'message', object: message
  end
end
