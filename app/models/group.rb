class Group < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :memberships
  has_many :users, through: :memberships
  # if you delete a group it willd estroy all the messages
  # @group = Group.find(params[:id])
  # @group.messages.create()
end
