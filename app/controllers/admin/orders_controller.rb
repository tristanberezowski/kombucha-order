class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @flavours = Flavour.all
    @active_orders = Order.where("delivery_date > ?", DateTime.now)
  end

  def show
    @order = Order.find(params[:id])
  end
end
