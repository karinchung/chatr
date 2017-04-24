class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
