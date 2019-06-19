Rails.application.routes.draw do

    get 'admin/users/:id', to: 'admin/users#show'
    get 'admin/users', to: 'admin/users#index'
    post '/user_exemptions/', to: 'user_exemptions#update'

    devise_for :admins
        root to: "home#index"
    devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
        root to: "home#index"
    
end