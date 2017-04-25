class MessagesController < ApplicationController
  before_action :authorize

  def index
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
    @group = Group.find(params[:group_id])
    @delete_group = @group.messages.find @message
    if @delete_group.destroy
      redirect_to group_path(@group)
    end
  end

  private
  def message_params
    params.require(:message).permit(:id, :body)
  end
end
