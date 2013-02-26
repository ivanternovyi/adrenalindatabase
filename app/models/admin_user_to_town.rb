class AdminUserToTown < ActiveRecord::Base
  attr_accessible :town_id, :user_id
end
