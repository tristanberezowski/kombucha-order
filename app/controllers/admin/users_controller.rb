class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.where(["id = ?", params[:id]]).first
  end
end
