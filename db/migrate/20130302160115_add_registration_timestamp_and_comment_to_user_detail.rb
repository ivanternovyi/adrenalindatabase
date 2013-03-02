class AddRegistrationTimestampAndCommentToUserDetail < ActiveRecord::Migration
  def change
    add_column :user_details, :registration_timestamp, :datetime
    add_column :user_details, :comment, :text
  end
end
