class UserTripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find params[:id]
    @trip_dates = @trip.get_unregistered_dates(current_user)
    session[:trip] = @trip.id
  end
end
