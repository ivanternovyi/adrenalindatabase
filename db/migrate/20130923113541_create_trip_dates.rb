class CreateTripDates < ActiveRecord::Migration
  def change
    create_table :trip_dates do |t|
      t.datetime :date_from
      t.datetime :date_to
      t.integer :trip_id
      t.integer :price

      t.timestamps
    end

    add_index :trip_dates, :trip_id
    add_index :trip_dates, :date_from
    add_index :trip_dates, :date_to
  end
end
