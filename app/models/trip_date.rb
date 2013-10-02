class TripDate < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :price, :trip_id

  belongs_to :trip

  def date_f
    date_from.to_date
  end

  def date_t
    date_to.to_date
  end
end
