class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @cart = current_user.cart
    @order = Order.new
    @order.user = current_user
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.add_products(cart_products)
    if @order.save
      clear_cart
      redirect_to @order, notice: t('orders.create.success')
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
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

  def cart_products
    current_user.cart_products
  end

  def clear_cart
    current_user.cart.destroy!
  end
end
