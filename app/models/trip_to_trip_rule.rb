class TripToTripRule < ActiveRecord::Base
  attr_accessible :trip_id, :trip_rule_id

  belongs_to :trip_rule
  belongs_to :trip
end
