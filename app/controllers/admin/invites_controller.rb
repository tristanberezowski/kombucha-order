class Admin::InvitesController < Admin::ApplicationController
  
  def index
    @invites = Invite.all
  end
  
  def new
    @invite = Invite.new
    @invite.delivery_exemptions.build
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.admin = current_admin
    if @invite.save
      redirect_to admin_users_path, notice: t('invites.create.success')
    else
      render :new
    end
  end

  def edit
    @invite = Invite.find(params[:id])
    @invite.deliver!
    redirect_to admin_users_path
  end

  private

  def invite_params
    params.require(:invite).permit(
      :email,
      delivery_exemptions_attributes: [
        :id,
        :fee
      ]
    )
  end
end
