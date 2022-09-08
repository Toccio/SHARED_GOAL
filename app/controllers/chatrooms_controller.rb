class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def index
    @chatrooms = Chatroom.all
    authorize @chatrooms
  end

  def create
    @chatroom = Chatroom.new(set_chatroom)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
    authorize @chatroom
  end

  def show
    @chatrooms = Chatroom.all
    @message = Message.new
    @chatroom = policy_scope(Chatroom).find(params[:id])
    authorize @chatroom
  end

  private

  def set_chatroom
    params.require(:chatroom).permit(:name)
  end
end
