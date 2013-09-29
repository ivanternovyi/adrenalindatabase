class UserTripOrder < ActiveRecord::Base
  attr_accessible :price, :trip_date_id, :trip_id, :user_id

  belongs_to :user
  belongs_to :trip
  belongs_to :trip_date
end
