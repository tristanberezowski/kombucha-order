require "base64"
require 'intuit-oauth'

class Admin::QuickbooksController < Admin::ApplicationController

  def authorize
    redirect_url = "http://0aec4fc5.ngrok.io/admin/quickbooks/authorize/"
    oauth_client = IntuitOAuth::Client.new(ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'], redirect_url, 'sandbox')
    scopes = [
        IntuitOAuth::Scopes::OPENID
    ]
    authorizationCodeUrl = oauth_client.code.get_auth_uri(scopes)
    @redirect = authorizationCodeUrl

  end

  def index
    oauth_client = IntuitOAuth::Client.first
    @result = oauth_client.token.get_bearer_token('The_authorization_code')

  end
end