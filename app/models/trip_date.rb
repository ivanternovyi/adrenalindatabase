class TripDate < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :trip_id

  belongs_to :trip
end
