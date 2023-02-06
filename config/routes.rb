Rails.application.routes.draw do
  resources :signups, only: [:create]
  # get '/signups', to: 'signups#create'
  # get '/signups_custom', to: 'signups#custom_method'

  resources :campers, except: [:destroy, :update]  # only: [:index, :show, :create]
  # get '/campers', to: "campers#index"
  # get '/campers/:id', to: "campers#show"
  # post '/campers', to: "campers#create"


  resources :activities, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
