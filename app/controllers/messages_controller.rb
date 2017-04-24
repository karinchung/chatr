class MessagesController < ApplicationController
  before_action :authorize

  def index
    @message = Message.all
  end

  def create
  end

  def new
    # @message = Message.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
