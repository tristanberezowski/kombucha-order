class Admin::RefreshTokensController < Admin::ApplicationController

  def new
    @refresh_token = RefreshToken.new
  end

  def create
    @token = RefreshToken.new(token_params)

    if @token.save
      redirect_to(
        admin_dashboard_path,
        notice: t('tokens.create.success')
      )
    else
      render :new
    end

  end

  private

  def token_params
    params.require(:refresh_token).permit(
      :name
    )
  end

end
