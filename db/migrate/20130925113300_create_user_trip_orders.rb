class CreateUserTripOrders < ActiveRecord::Migration
  def change
    create_table :user_trip_orders do |t|
      t.integer :user_id
      t.integer :trip_date_id
      t.integer :trip_id
      t.integer :price

      t.timestamps
    end
    add_index :user_trip_orders, :user_id
    add_index :user_trip_orders, :trip_id
    add_index :user_trip_orders, :trip_date_id
  end
end
