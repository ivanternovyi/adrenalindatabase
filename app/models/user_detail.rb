class UserDetail < ActiveRecord::Base
  attr_accessible :mid_name, :name, :post_address, :surname, :birthday, :user_id

  belongs_to :user
end
