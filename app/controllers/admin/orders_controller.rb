class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @flavours = Flavour.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
