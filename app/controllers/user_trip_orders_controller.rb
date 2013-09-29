class UserTripOrdersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @user_trip_orders = UserTripOrder.all
  end

  def create
    @user = current_user
    price = TripDate.find(params[:trip_date_id]).price
    @trip_order = UserTripOrder.create(user_id: @user.id, trip_id: params[:trip_id], trip_date_id: params[:trip_date_id], price: price)
    if @trip_order.save
      redirect_to user_path(@user), notice: t(:success_register, scope: :trip_date)
    else
      redirect_to user_trip_path(params[:trip_id]), notice: t(:fail_to_register, scope: :trip_date)
    end
  end
end
