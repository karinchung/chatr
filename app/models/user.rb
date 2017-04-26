class User < ApplicationRecord
  has_secure_password
  # require unique email
  validates :email, uniqueness: true
  has_many :messages, dependent: :destroy  # if I delete my account all my messages to go
  has_many :memberships
  has_many :groups, through: :memberships
end

# has many groups through what they've created
# many memberships through the groups they belong_to

# current user does
#
#
# @group = Group.create
# @group.users << current_user
