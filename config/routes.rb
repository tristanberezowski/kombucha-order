Rails.application.routes.draw do

  devise_for :admins
    root to: "home#index"
  devise_for :users, controllers: { registrations: 'users/registrations'}
    root to: "home#index"

    namespace :admin do

    end
end
