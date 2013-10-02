class Trip < ActiveRecord::Base
  attr_accessible :description, :title, :rule, :trip_dates
  has_many :trip_dates, dependent: :destroy

  def get_unregistered_dates(user)
    unless user.nil?
      registered_tr_dat_ids = UserTripOrder.where('user_id = ?', user.id).collect{ |usr| usr.trip_date_id }
      registered_tr_dat_ids = '' unless registered_tr_dat_ids.any?
      trip = TripDate.where('trip_id = ? AND id NOT IN (?)', self.id, registered_tr_dat_ids)
    end

    trip = self.trip_dates if user.nil?

    trip
  end
end
