class Cart::ProductsController < ApplicationController
  def create
    @product = Product.find(params[:id])
    cart_product = CartProduct.new(
      product: @product,
      cart: current_user.cart
    )

    if cart_product.save
      redirect_to products_path, notice: t('order.create.success')
    else
      redirect_to products_path, notice: t('order.create.fail')
    end
  end
end
