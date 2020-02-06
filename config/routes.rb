Rails.application.routes.draw do
  namespace :admin do
    get 'quickbooks/index'
  end
  devise_for :admins
  authenticated :admin do
    root 'admin/dashboard#show', as: :authenticated_root
  end

  root to: "products#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :orders, only: [:new, :create, :show]
  resources :invites, only: [:show]

  namespace :cart do
    resources :products, only: [] do
      member do
        post :create
      end
    end
  end

  namespace :admin do
    resources :invites, only: [:index, :create, :new, :edit]
    resource :dashboard, only: [ :show ], controller: 'dashboard'
    resources :products
    resources :liquids, only: [
      :index, :new, :create
    ]
    resources :flavours, only: [
      :index, :new, :create, :edit, :update
    ]
    resources :containers, only: [
      :index, :new, :create, :edit, :update
    ]
    resources :users, only: [:show, :index, :edit, :update]
    resources :user_exemptions, only: [:update]
    resources :orders, only: [:show, :index, :destroy]
    resources :refresh_tokens, only: [:new, :create]
    get '/quickbooks', to: 'quickbooks#index'
  end
end
