class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :groups
  has_many :memberships
  has_many :groups, through: :memberships
end

# has many groups through what they've created
# many memberships through the groups they belong_to
