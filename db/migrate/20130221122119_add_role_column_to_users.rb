class AddRoleColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, default: Role.find_by_name('RegularUser').id
    add_index :users, :role_id
  end
end
