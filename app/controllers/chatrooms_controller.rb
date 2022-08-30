class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = policy_scope(Chatroom).find(params[:id])
    authorize @chatroom
  end

end
