class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :user_id
      t.string :name
      t.string :surname
      t.string :mid_name
      t.string :post_address

      t.timestamps
    end
    add_index :user_details, :user_id
    add_index :user_details, :name
    add_index :user_details, :surname
    add_index :user_details, :mid_name
  end
end
