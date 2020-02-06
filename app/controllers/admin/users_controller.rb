class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
    @undelivered = Invite.undelivered.order(created_at: :desc)
    @delivered = Invite.delivered.order(created_at: :desc)
  end

  def show
    @user = User.where(["id = ?", params[:id]]).first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(admin_users_path, notice: t('users.update.success'))
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :company_name, :email,
      :shipping_address, :shipping_postal,
      :shipping_city, :shipping_province
    )
  end
end