class AddBirthdayToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :birthday, :date
    add_index :user_details, :birthday
  end
end
