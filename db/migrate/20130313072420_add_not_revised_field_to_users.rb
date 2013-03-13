class AddNotRevisedFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :not_revised, :boolean, default: true
    add_index :users, :not_revised
  end
end
