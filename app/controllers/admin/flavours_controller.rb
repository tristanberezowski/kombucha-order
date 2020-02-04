class Admin::FlavoursController < Admin::ApplicationController
  def index
    @flavours = Flavour.all
  end

  def edit
    @liquids = Liquid.all
    @flavour = Flavour.find(params[:id])
  end

  def update
    @flavour = Flavour.find(params[:id])
    if @flavour.update(flavour_params)
      redirect_to(
        admin_flavours_path, notice: t('flavours.update.success')
      )
    else
      render :edit
    end
  end

  def new
    @flavour = Flavour.new
    @liquids = Liquid.all
  end

  def create
    @flavour = Flavour.new(new_flavour_params)
    if @flavour.save
      redirect_to(
        admin_flavours_path, notice: t('flavours.create.success')
      )
    else
      render :index
    end
  end

  def new_flavour_params
    new_flavour = params.require(:flavour).permit(
      :name,
      :description,
      :liquid
    )
    #TODO: DISGUSTING!!!
    new_flavour[:liquid] = Liquid.find new_flavour[:liquid]
    new_flavour
  end

  def flavour_params
    params.require(:flavour).permit(
      :name,
      :description
    )
  end
end
