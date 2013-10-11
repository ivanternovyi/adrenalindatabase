class AdminTripOrderPaymentsController < ApplicationController
  authorize_resource class: false
  before_filter :set_order

  def index
    @payments = get_order.user_payment_trip_orders
  end

  def destroy
    @payment = get_order.find params[:id]
  end

  private
  def get_order
    UserTripOrder.find params[:admin_user_trip_order_id]
  end

  def set_order
    @order = get_order
  end
end
