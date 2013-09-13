class UserToTripDate < ActiveRecord::Base
  attr_accessible :trip_date_id, :user_id, :trip_date

  belongs_to :user
  belongs_to :trip_date
end
