# encoding: utf-8
class CardInfo < ActiveRecord::Base
  attr_accessible :barcode, :send_date, :reminder_date, :user_id, 
  								:payment_infos_attributes, :card_number, :valid_unlimit,
  								:comment, :discard, :valid_until, :payment_reward 

  belongs_to :user
  has_many :payment_infos, dependent: :destroy
  
  validates_uniqueness_of :card_number, message: 'Помилка: Дублюється номер карти!'
  validates_format_of :card_number, with: /^[0-9]+$/, message: 'Помилка: Неправильний код карти!'
  
  accepts_nested_attributes_for :payment_infos, allow_destroy: true, reject_if: lambda {|attrs| attrs.all? {|key, value| value.blank?}}

  scope :active_cards, where(discard: false)

  def self.active_card
  	active_cards.first
  end
end
