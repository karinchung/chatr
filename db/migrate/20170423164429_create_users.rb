class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :profile_image
      t.string :password_digest
      t.string :user_name

      t.timestamps
    end
  end
end
