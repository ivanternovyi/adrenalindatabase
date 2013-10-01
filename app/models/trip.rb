class Trip < ActiveRecord::Base
  attr_accessible :description, :title, :rule, :trip_dates
  has_many :trip_dates, dependent: :destroy

  def get_unregistered_dates(user)
  	return TripDate.where('trip_id = ? AND id NOT IN (?)', self.id, 
  		UserTripOrder.where('user_id = ?', user.id).collect{ |usr| usr.trip_date_id }) unless user.nil?
  	return self.trip_dates if user.nil?
  end
end
