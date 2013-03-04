class PaymentInfo < ActiveRecord::Base
  attr_accessible :card_info_id, :payment, :payment_date, :paying_method
end
