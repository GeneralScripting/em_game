class ChatMessagesController < ApplicationController

  def create
    @chat_message = ChatMessage.create params[:chat_message].merge(:user => current_user)
  end

end
