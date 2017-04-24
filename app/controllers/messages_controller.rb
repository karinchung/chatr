class MessagesController < ApplicationController
  before_action :authorize

  def index
    @message = Message.all
    @new_message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to messages_path
    else
      redirect_to messages_path
      # error or do something else?
    end
  end

  def new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def show
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
