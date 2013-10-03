class AdminUserTripOrdersController < ApplicationController
  authorize_resource class: false

  def index
    @user = user_profile
    @user_trip_dates = user_profile.user_trip_orders
  end

  def update
    user_trip_dates = UserTripOrder.find(params[:id])
    user_trip_dates.update_attributes(params[:user_trip_order])
  end

  def destroy
    trip_date = TripDate.find params[:id]
    user_profile.trip_dates.delete trip_date 
    redirect_to user_admin_user_trip_orders_path(user_profile)
  end

  private
  def user_profile
    User.find params[:user_id]    
  end
end
