Rails.application.routes.draw do
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/edit'
    get 'products/show'
  end
    root to: "home#index"

    get 'admin/users/:id', to: 'admin/users#show'
    get 'admin/users', to: 'admin/users#index'
    post '/user_exemptions/', to: 'user_exemptions#update'

    devise_for :admins
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    namespace :admin do
      resources :products, only: [:new, :index, :create]
    end
end
