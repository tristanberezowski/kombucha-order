class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to @order, notice: t('orders.create.success')
    else
      render :new
    end
  end

  def show
  end

  def order_params
    params.require(:order).permit(
      :billing_name,
      :billing_address,
      :billing_city,
      :billing_postal,
      :billing_province,
      :billing_country,
      :shipping_name,
      :shipping_address,
      :shipping_city,
      :shipping_postal,
      :shipping_province,
      :shipping_country,
      :note
    )
  end
end
