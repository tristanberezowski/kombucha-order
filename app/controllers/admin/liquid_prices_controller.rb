class Admin::LiquidPricesController < Admin::ApplicationController

  def index
    @liquid_prices = LiquidPrice.where(user: nil)
  end

  def new
    @liquid_price = LiquidPrice.new
    @user = User.find(params[:userid])
    @containers = Container.all
    @liquids = Liquid.all
  end

  def create
    
    # params[:liquid_price][:liquid] = Liquid.find(params[:liquid_price][:liquid]).to_s
    # params[:liquid_price][:container] = Container.find(params[:liquid_price][:container])
    @liquid_price = LiquidPrice.new(liquid_price_params)
    if @liquid_price.save
      redirect_to(admin_user_path(@liquid_price.user), notice: t('liquid_prices.create.success'))
    else
      render :index
    end
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
    params.require(:liquid_price).permit(:price, :liquid_id, :container_id, :user_id)
  end

end
