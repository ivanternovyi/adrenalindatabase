# encoding: utf-8
class CardInfo < ActiveRecord::Base
  attr_accessible :barcode, :send_date, :reminder_date, :user_id, 
  								:payment_infos_attributes, :card_number, :valid_unlimit,
  								:comment, :discard, :valid_until, :payment_reward 

  before_save :calculate_barcode

  belongs_to :user
  has_many :payment_infos, dependent: :destroy
  
  validates_uniqueness_of :card_number, message: 'Помилка: Дублюється номер карти!'
  validates_format_of :card_number, with: /^[0-9]{4}$/, message: 'Помилка: Неправильний код карти!'
  validates_date :send_date
  validates_date :reminder_date
  validates_date :valid_until
  
  accepts_nested_attributes_for :payment_infos, allow_destroy: true, reject_if: lambda {|attrs| attrs.all? {|key, value| value.blank?}}

  scope :active_cards, where(discard: false)

  def self.active_card
  	active_cards.first
  end

  def calculate_barcode
    # instructions here: http://www.gs1.org/barcodes/support/check_digit_calculator
    code = self.card_number
    if is_digit(code) && (code.length == 4)
      const_prefix = '000'
      full_dig_array = (const_prefix + code).scan(/./)

      odd_num_dig_sum = 0
      full_dig_array.each_with_index{ |val, index| odd_num_dig_sum += val.to_i if (index + 1).odd? }

      even_num_dig_sum = 0
      full_dig_array.each_with_index{ |val, index| even_num_dig_sum += val.to_i if (index + 1).even? }

      odd_num_dig_sum *= 3
      substruction = ((even_num_dig_sum + odd_num_dig_sum) % 10)
      if substruction == 0
        substruction = 10
      end
      check_digit = 10 - substruction
      self.barcode = const_prefix + code + check_digit.to_s
    end
  end

  def is_digit(var)
    if (var =~ /^[0-9]+$/).nil?
      false
    elsif (var =~ /^[0-9]+$/) == 0
      true
    end
  end  
end
