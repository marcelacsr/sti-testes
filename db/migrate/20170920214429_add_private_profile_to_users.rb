class AddPrivateProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :private_profile, :boolean, default: false
  end
end
