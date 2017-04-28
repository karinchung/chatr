class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  after_validation :log_errors, :if => Proc.new {|m| m.errors}
  before_save :check_user_existence

   def check_user_existence
      recipient = User.find_by_name(recipient_id)
     if recipient
        self.recipient_id = recipient.id
     end
   end

  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end
end
