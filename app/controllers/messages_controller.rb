class MessagesController < ApplicationController
  before_action :authorize

  def index
    @message = Message.all
    @new_essage = Message.new
  end

  def create
    @message = Message.new(post_params)
    @message.user = current_user
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
