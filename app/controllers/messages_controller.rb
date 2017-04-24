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
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
