class PaymentInfo < ActiveRecord::Base
  attr_accessible :card_info_id, :payment, :payment_date, :payment_reward, :valid_until_date, :paying_method
end
