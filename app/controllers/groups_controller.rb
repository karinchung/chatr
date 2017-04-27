class GroupsController < ApplicationController
  before_action :authorize
  # before_action :allowMembers, only: [:show]

  def index
    @group = Group.all
    @new_group = Group.new

  end

  def create
    @group = Group.new(group_params)
    if @group.update_attributes(group_params)
      Membership.create(user: current_user, group: @group)
      redirect_to group_path(@group)
    end
  end

  def new
  end

  def edit
  end

  def show
    @new_group = Group.new
    @group = Group.find(params[:id])
    @messages = @group.messages
    @new_message = Message.new
    @memberships = Membership.all
    # @new_membership = Membership.create(user: selected user, group: @group)
  end

  def update
  end

  def destroy
  end

  def delete_message
    @group = Group.find(params[:id])
    @messages = @group.messages(params[:id])
    if @message.destroy
      redirect_to group_path(@group)
    end
  end

  private
  def group_params
    params.require(:group).permit(:title, :id, :_destroy)
  end
end
