class Admin::ContainersController < Admin::ApplicationController
  def index
    @containers = Container.all
  end

  def new
    @container = Container.new
  end

  def create
    @container = Container.new(container_params)
    if @container.save
      redirect_to admin_container_path(@container)
    else
      render :new
    end
  end

  def container_params
    params.require(:container).permit(:name, :volume)
  end
end
