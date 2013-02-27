class UserDetail < ActiveRecord::Base
  attr_accessible :mid_name, :name, :post_address, :surname, :user_id

  belongs_to :user
end
