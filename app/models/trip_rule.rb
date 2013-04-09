class TripRule < ActiveRecord::Base
  attr_accessible :name, :trip_id

  validates_presence_of :name

  has_many :trip_to_trip_rules, dependent: :destroy
  has_many :trips, through: :trip_to_trip_rules
end
