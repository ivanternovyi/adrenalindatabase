class CreateUserTripDates < ActiveRecord::Migration
  def change
    create_table :user_trip_dates do |t|
      t.integer :user_id
      t.integer :trip_id
      t.integer :trip_date_id

      t.timestamps
    end
    add_index :user_trip_dates, :user_id
    add_index :user_trip_dates, :trip_id
    add_index :user_trip_dates, :trip_date_id
  end
end
