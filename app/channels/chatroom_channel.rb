class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # binding
    stream_from "chatroom-#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
