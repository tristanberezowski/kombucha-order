class Cart::ProductsController < ApplicationController
  def create
    @product = Product.find(params[:id])

    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.product = @product
    @cart_product.cart = current_user.cart

    if @cart_product.save
      redirect_to products_path, notice: t('order.create.success')
    else
      redirect_to products_path, notice: t('order.create.fail')
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(
      :quantity,
    )
  end
end
