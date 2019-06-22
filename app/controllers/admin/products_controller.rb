class Admin::ProductsController < Admin::ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(name: :desc)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: t('products.create.success')
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to(
        admin_product_path(@product), notice: t('products.update.success')
      )
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path, notice: t('products.destroy.success')
    else
      render :index
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

  def set_product
    @product = Product.find(params[:id])
  end
end
