class InvitesController < ApplicationController
  def index
  end

  def create
    @invite = Invite.new({message: params[:invite][:message]})
    @invite.sender = current_user
    @recipient = User.find_by_name(params[:invite][:recipient_id])
    @invite.recipient = @recipient
    @group = Group.find(params[:group_id])
    @invite.group = @group
    if @invite.save
      if @invite.recipient != nil
      @invite.recipient.groups.push(@invite.group)
      redirect_to group_path(@group)
      end
    else
      redirect_to root_path
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
  def invite_params
    params.require(:invite).permit(:recipient_id, :message)
  end
end
