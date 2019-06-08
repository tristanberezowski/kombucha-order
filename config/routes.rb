Rails.application.routes.draw do


    post '/user_exemptions/', to: 'user_exemptions#update'

  devise_for :admins
    root to: "home#index"
  devise_for :users, controllers: { registrations: 'users/registrations'}
    root to: "home#index"

    namespace :admin do

    end
end
