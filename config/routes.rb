Rails.application.routes.draw do

    get '/login' => 'sessions#new'
    #post '/login' => 'sessions#create'
    #get '/logout' => 'sessions#destroy'

    namespace :admin do

    end
end
