class MessagesController < ApplicationController
  before_action :authorize


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
    @group = @message.group
  end

  def show
  end

  def update
    @message = Message.find(params[:id])
    @group = Group.find(params[:group_id])
    if @message.update_attributes(message_params)
      redirect_to group_path(@group)
    else
      redirect_to group_path(@group)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @group = Group.find(params[:group_id])
    # @delete_group = @group.messages.find @message
    if @message.destroy
      redirect_to group_path(@group)
    end
  end

  private
  def message_params
    params.require(:message).permit(:id, :body)
  end

end
