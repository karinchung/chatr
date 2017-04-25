class MessagesController < ApplicationController
  before_action :authorize

  def index
    # @message = Message.all
    # @new_message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @group = Group.find(params[:group_id])

    @group.messages << @message
    redirect_to group_path(@group)
  end

  def new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def show
    # redirect_to group_path
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
    params.require(:message).permit(:id, :body)
  end
end
