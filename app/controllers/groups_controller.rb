class GroupsController < ApplicationController
  def index
    @group = Group.all
    @new_group = Group.new

  end

  def create
    @group = Group.new(group_params)
    if @group.update_attributes(group_params)
      redirect_to groups_path
    else
      redirect_to groups_path
    end
  end

  def new
  end

  def edit
  end

  def show
    @group = Group.find(params[:id])
    @messages = @group.messages
    @new_message = Message.new
  end

  def new_message
    @group = Group.find(params[:id])
    @group.messages.create({body: params[:message][:body], user: current_user, group: @group})
    redirect_to group_path(@group)
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:message).permit(:body)
    # params.require(:group).permit(:title, :id)
  end
end
