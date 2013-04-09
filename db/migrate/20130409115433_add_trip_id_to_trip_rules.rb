class AddTripIdToTripRules < ActiveRecord::Migration
  def change
    add_column :trip_rules, :trip_id, :integer
    add_index :trip_rules, :trip_id
  end
end
