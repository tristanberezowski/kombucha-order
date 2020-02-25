class Admin::LiquidPricesController < Admin::ApplicationController

  def index
    @liquid_prices = LiquidPrice.where(user: nil)
  end

  def edit
    @liquid_price = LiquidPrice.find(params[:id])
  end

  def update
    @liquid_price = LiquidPrice.find(params[:id])
    if @liquid_price.update(liquid_price_params)
      redirect_to(admin_liquid_prices_path, notice: t('liquid_prices.update.success'))
    else
      render :index
    end
  end

  private

  def liquid_price_params
    params.require(:liquid_price).permit(:price)
  end

end
