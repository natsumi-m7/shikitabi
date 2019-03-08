Rails.application.routes.draw do
  devise_for :users
  # post 'spots#create'
  get 'seasons/show'
  root 'spots#top'
  get '/', to: 'spots#top'
  get '/spots/new', to: 'spots#new'
  post '/spots', to: 'spots#create'
  resources :users
  resources :seasons,only:[:show] do
    resources :spots,only:[:show,:index] do
      resources :comments,only:[:create,:destroy]
      resource :favorites,only:[:create,:destroy]
      resources :went_spots,only:[:create,:destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
