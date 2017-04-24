class RemoveUserFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_reference :groups, :user, foreign_key: true
  end
end
