class TripRule < ActiveRecord::Base
  attr_accessible :name, :trip_id

  belongs_to :trip
end
