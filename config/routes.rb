Rails.application.routes.draw do
  namespace :admin do
    get 'invites/new'
  end
  namespace :admin do
    get 'dashboard/index'
  end
    root to: "products#index"

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
      resources :invites, only: [:create, :new]
      resource :dashboard, only: [ :index ]
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
      resources :orders, only: [:show, :index] do
        resource :payment, only: [:create, :new]
      end
    end
end
