class Admin::UserExemptionsController < Admin::ApplicationController
  def edit
    exemption = UserExemption.find(params[:id])
    @exemption_type = exemption.exemptable_type
    @user_exemption = exemption.exemptable
  end
end
