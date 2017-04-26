class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :is_member?, :allowMembers

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_group
    @group = Group.find(params[:group_id])
    @members = @group.user_ids
  end

  # does the group contain the current user
  # does the user.groups contain this group
  # need group...

  def is_member?
    # @group = Group.find(params[:id])
    # @group.users.include? current_user
    current_user.groups.include? @group
  end

  def logged_in?
    !! current_user
  end

  def authorize
    unless logged_in?
      redirect_to new_session_path
    end
  end

  # def allowMembers
  #   unless is_member?
  #     redirect_to groups_path
  #   end
  # end

end
