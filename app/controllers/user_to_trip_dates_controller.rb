# encoding: utf-8
class UserToTripDatesController < ApplicationController
  load_and_authorize_resource

  def create
    user = current_user
    if user.nil?
      redirect_to new_user_session_path, alert: 'Щоб записатись на тур Вам необхідно увійти у систему, або зареєструватися.'
      session[:trip] = params[:trip_id]
      return
    end

    trip_date = TripDate.find(params[:trip_date_id])
    user_to_trip_date = user.user_to_trip_dates.build(trip_date: trip_date)

    if user_to_trip_date.save
      session[:trip] = nil
      redirect_to user, notice: 'Ви записались на тур.'
    else
      redirect_to :back
    end
  end

  def destroy
    user = current_user
    trip_date = UserToTripDate.find_by_user_and_trip_date(params[:id], params[:trip_date_id])
    UserToTripDate.find(trip_date).destroy
    redirect_to user, notice: 'Ви успішно відмовились від участі у турі.'
  end
end
