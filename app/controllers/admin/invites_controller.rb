class Admin::InvitesController < Admin::ApplicationController
  def new
    @invite = Invite.new
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

  private

  def invite_params
    params.require(:invite).permit(
      :email
    )
  end
end
