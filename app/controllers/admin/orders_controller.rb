class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @flavours = Flavour.all
    @undelivered_orders = Order.undelivered
  end

  def show
    @order = Order.find(params[:id])
    if @order.payment == nil
      Payment.new(order: @order)
    end
  end
end
