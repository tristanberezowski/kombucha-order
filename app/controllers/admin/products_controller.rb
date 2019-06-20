class Admin::ProductsController < Admin::ApplicationController
  def index
    @products = Product.all.order(name: :desc)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.new
    @old = Product.where(["id = ?", params[:id]]).first
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: t('products.create.success')
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :rentable,
      :purchasable
    )
  end
end
