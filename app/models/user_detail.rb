# encoding: utf-8
class UserDetail < ActiveRecord::Base
  attr_accessible :mid_name, :name, :post_address, :surname, :birthday, :user_id, :registration_timestamp, :comment

  belongs_to :user

  validates_presence_of :surname, message: 'Прізвище не повинно бути порожнім'
  validates_presence_of :name, message: 'Ім\'я не повинно бути порожнім'
  validates_presence_of :mid_name, message: 'По-Батькові не повинно бути порожнім'
  validates_presence_of :post_address, message: 'Поштова адреса не може бути порожньою'
  validates_presence_of :birthday, message: 'Дата народження не може бути порожньою'
end
