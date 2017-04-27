class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  has_attached_file :profile_photo,
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

validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.profile_image = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
    if @user.save
      redirect_to new_session_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  validates_attachment_content_type :profile_photo, :content_type: /\Aimage\/.*\Z/
end
