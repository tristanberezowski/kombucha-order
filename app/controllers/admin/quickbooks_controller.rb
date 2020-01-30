require "base64"

class Admin::QuickbooksController < Admin::ApplicationController
  def index
    qb_access_token = ""
    qb_refresh_token = ""
    client_id = ""
    client_secret = ""


    response = Faraday.post("https://sandbox.api.intuit.com/oauth2/v1/tokens/bearer?grant_type=refresh_token&refresh_token=#{qb_refresh_token}") do |req|
      req.headers['Authorization'] = "Basic #{Base64.strict_encode64(client_id + ":" + client_secret)}"
      req.headers['Accept'] = 'application/json',
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    end
    @user_info = response

    # qb_access_token = AccessToken.last
    # qb_refresh_token = RefreshToken.last

    # access_token = OAuth2::AccessToken.new(
    #   oauth2_client, qb_access_token, refresh_token: qb_refresh_token
    # )

  end
end