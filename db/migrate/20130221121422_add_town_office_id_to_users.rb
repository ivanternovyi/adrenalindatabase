class AddTownOfficeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :town_office_id, :integer
    add_index :users, :town_office_id
  end
end
