class PaymentInfo < ActiveRecord::Base
  attr_accessible :card_info_id, :payment, :payment_date, :payment_reward, :reminder_date, :valid_until_date, :paying_method
end
