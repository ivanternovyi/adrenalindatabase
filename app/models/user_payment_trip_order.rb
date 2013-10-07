class UserPaymentTripOrder < ActiveRecord::Base
  attr_accessible :amount, :payment_date, :user_trip_order_id

  belongs_to :user_trip_order
end