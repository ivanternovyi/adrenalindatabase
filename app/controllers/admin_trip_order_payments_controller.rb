class AdminTripOrderPaymentsController < ApplicationController
  authorize_resource class: false
  before_filter :set_order

  def index
    @payments = get_order.user_payment_trip_orders
    @payment = get_order.user_payment_trip_orders.build
  end

  def create
    @payment = get_order.user_payment_trip_orders.build(params[:user_payment_trip_order])
    if @payment.save
      @payments = get_order.user_payment_trip_orders
      @payment = get_order.user_payment_trip_orders.build
    end
  end

  def edit
    @payments = get_order.user_payment_trip_orders
    @payment = get_order.user_payment_trip_orders.find params[:id]
  end

  def update
    @payment = get_order.user_payment_trip_orders.find params[:id]
    if @payment.update_attributes(params[:user_payment_trip_order])
      @payments = get_order.user_payment_trip_orders
      @payment = get_order.user_payment_trip_orders.build
    end
  end

  def destroy
    @payment = get_order.user_payment_trip_orders.find params[:id]
    @payment.destroy
    @payments = get_order.user_payment_trip_orders
    @payment = get_order.user_payment_trip_orders.build
  end

  private
  def get_order
    UserTripOrder.find params[:admin_user_trip_order_id]
  end

  def set_order
    @order = get_order
  end
end
