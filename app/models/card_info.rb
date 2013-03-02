class CardInfo < ActiveRecord::Base
  attr_accessible :barcode, :send_date, :user_id, :payment_infos_attributes, :card_number

  belongs_to :user

  has_many :payment_infos, dependent: :destroy
  accepts_nested_attributes_for :payment_infos

  scope :active_cards, where(discard: false)

  def self.active_card
  	active_cards.first
  end
end
