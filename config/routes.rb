Rails.application.routes.draw do

  devise_for :users
    root to: "session#new"
    get '/login' => 'sessions#new'
    #post '/login' => 'sessions#create'
    #get '/logout' => 'sessions#destroy'

    namespace :admin do

    end
end
