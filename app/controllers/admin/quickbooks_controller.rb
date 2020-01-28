class Admin::QuickbooksController < Admin::ApplicationController
  def index
    response = Faraday.get 'https://reqres.in/api/users'
    @user_info = response.body
  end
end
