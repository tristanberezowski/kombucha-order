class Admin::DeliveryExemptionsController < Admin::ApplicationController
  def update
    @delivery_exemption = DeliveryExemption.find(params[:id])
    if @delivery_exemption.update(delivery_exemption_params)
      redirect_to(admin_users_path, notice: t('users.update.success'))
    else
      redirect_to(admin_users_path, notice: t('users.update.fail'))
    end
  end

  def delivery_exemption_params
    params.require(:delivery_exemption).permit(:fee)
  end
end
