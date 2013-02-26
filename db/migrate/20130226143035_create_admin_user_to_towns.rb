class CreateAdminUserToTowns < ActiveRecord::Migration
  def change
    create_table :admin_user_to_towns do |t|
      t.integer :user_id
      t.integer :town_id

      t.timestamps
    end
    add_index :admin_user_to_towns, :user_id
    add_index :admin_user_to_towns, :town_id
  end
end
