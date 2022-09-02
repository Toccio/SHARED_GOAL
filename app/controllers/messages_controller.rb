class MessagesController < ApplicationController
  def create
      @chatroom = Chatroom.find(params[:chatroom_id])
      @message = Message.new(set_message)
      authorize @message
      #message needs a chatroom
       @message.chatroom = @chatroom
       #message needs a user
       @message.user = current_user
       if @message.save
        ChatroomChannel.broadcast_to(
          @chatroom,
          message: render_to_string(partial: "message", locals: { message: @message }),
          sender_id: @message.user.id
        )
        head :ok
      else
        render 'chatrooms/show'
      end
  end

  private

  def set_message
    params.require(:message).permit(:content)

  end
end
