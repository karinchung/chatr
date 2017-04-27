class AddAttachmentMessagePhotoToMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.attachment :message_photo
    end
  end

  def self.down
    remove_attachment :messages, :message_photo
  end
end
