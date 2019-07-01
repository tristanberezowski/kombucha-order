Rails.application.routes.draw do
  namespace :admin do
    get 'container/index'
    get 'container/new'
  end
  namespace :admin do
    get 'orders/index'
    get 'flavours/index'
    get 'flavours/new'
  end
  namespace :admin do
    get 'liquids/index'
    get 'liquids/new'
    get 'liquids/show'
  end
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
      resources :liquids, only: [
        :index, :new, :create
      ]
      resources :flavours, only: [
        :index, :new, :create
      ]
      resources :containers, only: [
        :index, :new, :create
      ]
      resources :users, only: [:show, :index]
      resources :user_exemptions, only: [:update]
      resources :orders, only: [:show, :index]
    end
end
