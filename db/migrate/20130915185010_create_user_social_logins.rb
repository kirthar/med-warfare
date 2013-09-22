class CreateUserSocialLogins < ActiveRecord::Migration
  def change
    create_table :user_social_logins do |t|
      t.string :provider
      t.string :uid
      t.references :user

      t.timestamps
    end
    add_index :user_social_logins, :user_id

    remove_column :users, :name
  end
end
