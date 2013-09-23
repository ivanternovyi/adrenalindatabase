class TripDate < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :price, :trip_id

  belongs_to :trip
end
