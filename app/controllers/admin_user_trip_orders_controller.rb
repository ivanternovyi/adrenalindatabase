class AdminUserTripOrdersController < ApplicationController
  authorize_resource class: false
  before_filter :set_user
  def index
    @trip_orders = get_user.user_trip_orders
  end

  def show
    @trip_orders = get_user.user_trip_orders
    @trip_order = get_user.user_trip_orders.find params[:id]
    @trip_order_payments = UserTripOrder.find(@trip_order.id).user_payment_trip_orders
  end

  def edit
    @trip_orders = get_user.user_trip_orders
    @trip_order = get_user.user_trip_orders.find params[:id]
  end

  def update
    @trip_order = get_user.user_trip_orders.find params[:id]
    if @trip_order.update_attributes(params[:user_trip_order])
      @trip_orders = get_user.user_trip_orders
    end
  end

  def destroy
    @trip_order = get_user.user_trip_orders.find params[:id]
    @trip_order.delete
    @trip_orders = get_user.user_trip_orders
  end

  private
  def get_user
    User.find params[:user_id]    
  end

  def set_user
    @user = get_user
  end
end
