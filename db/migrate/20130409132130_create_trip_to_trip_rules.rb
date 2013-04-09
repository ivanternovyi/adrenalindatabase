class CreateTripToTripRules < ActiveRecord::Migration
  def change
    create_table :trip_to_trip_rules do |t|
      t.integer :trip_id
      t.integer :trip_rule_id

      t.timestamps
    end

    add_index :trip_to_trip_rules, :trip_id
    add_index :trip_to_trip_rules, :trip_rule_id
  end
end
