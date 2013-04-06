# encoding: utf-8
class PaymentInfo < ActiveRecord::Base
  attr_accessible :card_info_id, :payment, :payment_date, :paying_method

  validates_presence_of :payment, message: 'Сума має бути вказана.'
  validates_presence_of :payment_date, message: 'Дата платежу має бути вказана.'
  validates_date :payment_date
end
