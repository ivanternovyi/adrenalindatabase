# encoding: utf-8
class UserToTripDatesController < ApplicationController
  def create
    user = current_user
    trip_date = TripDate.find(params[:trip_date_id])
    user_to_trip_date = user.user_to_trip_dates.build(trip_date: trip_date)

    if user_to_trip_date.save
      redirect_to user, notice: 'Ви записались на тур.'
    else
      redirect_to :back
    end
  end
end
