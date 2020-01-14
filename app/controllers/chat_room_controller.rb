class ChatRoomController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
    @message = Message.new
  end
end
