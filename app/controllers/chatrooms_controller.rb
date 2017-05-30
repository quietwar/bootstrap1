class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.where(user_id: current_user)
    @inbox = Chatroom.where(reciepient: current_user.id)
  end

  def show
    @chatroom = Chatroom.find(params[:user_id])
    @messages = @chatroom.messages.order(created_at: :desc).limit(140).reverse
  end

  def new
    @chatroom = Chatroom.user_id
    @chatroom = Chatroom.new
    @chatroom = @chatroom.messages.new

  end

  def create
    unless current_user
      flash[:alert] = "Please sign in or up first"
      redirect_to new_user_chatroom_path
    else
      @chatroom = @project.chatrooms.build(chatroom_params)
      @chatroom = current_user

    if @chatroom.save
      ActionCable.server.broadcast "messages",
          render(partial: 'messages/message', object: @chatroom )
        flash[:notice] = "Message has been left"
      else
        flash.now[:alert] = "Message has not been left"
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :user_id, :reciepient, mesages_attributes: [:body, :chatroom_id, :user_id])
  end

  def set_Chatroom
      @chatroom = Chatroom.find(params[:user_id])
    end
end
