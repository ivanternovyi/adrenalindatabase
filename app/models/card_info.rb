class CardInfo < ActiveRecord::Base
  attr_accessible :barcode, :send_date, :user_id

  belongs_to :user
end
