class UserToTripDate < ActiveRecord::Base
  attr_accessible :trip_date_id, :user_id, :trip_date

  belongs_to :user
  belongs_to :trip_date

  scope :find_by_user_and_trip_date, lambda { |u, td| select(:id).where("trip_date_id = ? AND user_id = ?", u, td).first }
end
