class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.build_order_billing_information
    @order.build_order_shipping_information

  end

  def create
    
  end

  def show
  end

  def order_params
    params.require(:order).permit(

    )
  end
end
