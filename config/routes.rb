Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/show'
  get 'carts/show'
    root to: "home#index"

    devise_for :admins
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    resources :products, only: [:index]

    resource :cart, only: [:show]

    resources :orders, only: [:new, :create, :show]

    namespace :cart do
      resources :products, only: [] do
        member do
          post :create
        end
      end
    end

    namespace :admin do
      resources :products
      resources :users, only: [:show, :index]
      resources :user_exemptions, only: [:update]
    end
end
