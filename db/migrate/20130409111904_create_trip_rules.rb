class CreateTripRules < ActiveRecord::Migration
  def change
    create_table :trip_rules do |t|
      t.string :name

      t.timestamps
    end
  end
end
