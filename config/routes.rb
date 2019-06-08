Rails.application.routes.draw do

  devise_for :admins
  get 'home/index'
  devise_for :users
    root to: "home#index"
    get '/login' => 'sessions#new'
    #post '/login' => 'sessions#create'
    #get '/logout' => 'sessions#destroy'

    namespace :admin do

    end
end
