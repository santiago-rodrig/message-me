class ChatRoomController < ApplicationController
  def index
    @messages = Message.all
  end
end
