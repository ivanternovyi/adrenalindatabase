class AdminPaymentTripOrdersController < ApplicationController
  authorize_resource class: false

  def new
    @trip_order = user_trip_order
    @user_payment_trip = @trip_order.user_payment_trip_orders.build
    respond_to do |format|
      format.js
    end
  end

  private
  def user_trip_order
    UserTripOrder.find params[:admin_user_trip_order_id]
  end
end