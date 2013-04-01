# encoding: utf-8
class Phone < ActiveRecord::Base
  attr_accessible :main, :phone_number, :user_id

  before_save :phone_clean

  validates_presence_of :phone_number, message: 'Не може бути порожнім'
  validates_format_of :phone_number, with: /^\+\d{1,3}\s\([0-9]{3}\)\s[0-9]{3}\-[0-9]{2}\-[0-9]{2}$/, message: 'Неправильний номер'

  belongs_to :user

  private
  def phone_clean
    self.phone_number = self.phone_number.gsub(/[()\-\+\s]*/, '')
  end
end
