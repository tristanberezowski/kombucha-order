class Admin::LiquidsController < Admin::ApplicationController
  def index
    @liquids = Liquid.all
  end

  def new
    @liquid = Liquid.new
  end

  def show
  end

  def create
    @liquid = Liquid.new(liquid_params)

    if @liquid.save
      redirect_to(
        admin_liquid_path(@liquid), 
        notice: t('liquids.create.success')
      )
    else
      render :new
    end
  end

  def liquid_params
    params.require(:liquid).permit(
      :name
    )
  end
end
