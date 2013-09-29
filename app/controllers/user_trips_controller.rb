class UserTripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find params[:id]
    session[:trip] = @trip.id
  end
end
