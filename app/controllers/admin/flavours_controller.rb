class Admin::FlavoursController < Admin::ApplicationController
  def index
    @flavours = Flavour.all
  end

  def new
    @flavour = Flavour.new
    @liquids = Liquid.all
  end

  def create
    @flavour = Flavour.new(flavour_params)
    if @flavour.save
      redirect_to(
        admin_flavours_path, notice: t('flavours.create.success')
      )
    else
      render :index
    end
    
  end

  def flavour_params
    new_flavour = params.require(:flavour).permit(
      :name,
      :description,
      :liquid
    )
    new_flavour[:liquid] = Liquid.find new_flavour[:liquid]
    new_flavour
  end
end
