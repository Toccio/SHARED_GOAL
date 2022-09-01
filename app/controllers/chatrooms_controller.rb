class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(set_chatroom)
    authorize @chatroom
    @chatroom.save
  end

  def show
    @message = Message.new
    @chatroom = policy_scope(Chatroom).find(params[:id])
    authorize @chatroom
  end

  private

  def set_chatroom
    params.require(:chatroom).permit(:name)
  end
end
