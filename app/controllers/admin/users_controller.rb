class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.where(["id = ?", params[:id]]).first
  end
end
