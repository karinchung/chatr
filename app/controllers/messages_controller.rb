class MessagesController < ApplicationController
  before_action :authorize
  has_attached_file :message_photo,
                    styles: {medium: "300x300#", thumb: "100x100#"},
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    s3_region: ENV["S3_REGION"],
                    s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

    def s3_credentials
      {
        bucket: ENV["S3_BUCKET_NAME"],
        access_key_id: ENV["S3_ACCESS_KEY_ID"],
        secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
      }
    end

validates_attachment_content_type :message_photo, content_type: /\Aimage\/.*\z/

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
