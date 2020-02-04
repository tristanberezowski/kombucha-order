class Admin::ContainersController < Admin::ApplicationController
  def index
    @containers = Container.all
  end

  def edit
    @container = Container.find(params[:id])
  end

  def update
    @container = Container.find(params[:id])
    if @container.update(container_params)
      redirect_to admin_containers_path, notice: t('containers.update.success')
    else
      render :update
    end

  end

  def new
    @container = Container.new
  end

  def create
    @container = Container.new(container_params)
    if @container.save
      redirect_to admin_containers_path, notice: t('containers.create.success')
    else
      render :new
    end
  end

  def container_params
    params.require(:container).permit(:name, :volume, :environmental_fee)
  end
end
