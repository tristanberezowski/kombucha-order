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

    end

  end

  private

  token_params do
    
  end

end
