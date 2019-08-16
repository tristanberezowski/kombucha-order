class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @case = Container.find_by(volume: 12 * 375)
    @flavours = Flavour.all
    @undelivered_orders = Order.undelivered
  end

  def show
    @order = Order.find(params[:id])
    if @order.payment == nil
      Payment.new(order: @order)
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.order_products.destroy_all
    if @order.payment
      @order.payment.destroy
    end
    if @order.destroy
      redirect_to admin_orders_path, notice: t('orders.destroy.success')
    else
      render :index
    end
  end
end
