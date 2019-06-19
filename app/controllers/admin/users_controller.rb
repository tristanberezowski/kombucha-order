class Admin::UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.where(["id = ?", params[:id]]).first
  end
end
