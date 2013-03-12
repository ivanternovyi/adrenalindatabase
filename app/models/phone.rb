class Phone < ActiveRecord::Base
  attr_accessible :main, :phone_number, :user_id

  validates_presence_of :phone_number
  validates_format_of :phone_number, with: /(^\+[0-9]{12,14}$)|(^[0-9]{9,12}$)|(^[0-9]{6,7}$)/

  belongs_to :user
end
