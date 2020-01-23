Rails.application.routes.draw do
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
      :index, :new, :create
    ]
    resources :containers, only: [
      :index, :new, :create
    ]
    resources :users, only: [:show, :index]
    resources :user_exemptions, only: [:update]
    resources :orders, only: [:show, :index, :destroy]
    resources :refresh_tokens, only: [:new, :create]
  end
end
