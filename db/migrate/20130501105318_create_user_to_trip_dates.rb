class CreateUserToTripDates < ActiveRecord::Migration
  def change
    create_table :user_to_trip_dates do |t|
      t.integer :user_id
      t.integer :trip_date_id

      t.timestamps
    end
  end
end
