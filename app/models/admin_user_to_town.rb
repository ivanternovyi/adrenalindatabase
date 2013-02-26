class AdminUserToTown < ActiveRecord::Base
  attr_accessible :town_id, :user_id

  belongs_to :user
  belongs_to :town
end
