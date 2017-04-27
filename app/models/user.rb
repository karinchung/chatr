class User < ApplicationRecord
  has_secure_password
  # require unique email
  validates :email, uniqueness: true
  has_many :messages, dependent: :destroy  # if I delete my account all my messages to go
  has_many :memberships
  has_many :groups, through: :memberships
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
end

# has many groups through what they've created
# many memberships through the groups they belong_to

# current user does
#
#
# @group = Group.create
# @group.users << current_user
