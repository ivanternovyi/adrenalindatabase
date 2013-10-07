class CreateUserPaymentTripOrders < ActiveRecord::Migration
  def change
    create_table :user_payment_trip_orders do |t|
      t.integer :amount
      t.integer :user_trip_order_id
      t.date :payment_date

      t.timestamps
    end

    add_index :user_payment_trip_orders, :user_trip_order_id
  end
end
