class Group < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :memberships
  has_many :users, through: :memberships
  has_many :invites
  # if you delete a group it will destroy all the messages
end
