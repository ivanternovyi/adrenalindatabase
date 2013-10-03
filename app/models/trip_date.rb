class TripDate < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :price, :trip_id

  has_many :user_trip_orders
  belongs_to :trip

  def date_f
    date_from.to_date
  end

  def date_t
    date_to.to_date
  end
end
