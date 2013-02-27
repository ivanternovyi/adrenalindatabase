class Phone < ActiveRecord::Base
  attr_accessible :main, :phone_number, :user_id

  belongs_to :user
end
