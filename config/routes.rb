Rails.application.routes.draw do
  root 'spots#top'
  devise_for :users
  get '/', to: 'spots#top'
  get '/season', to: 'spots#season'
  resources :users
  resources :spots do
    resources :comments,only:[:create,:destroy]
    resource :favorites,only:[:create,:destroy]
    resources :went_spots,only:[:create,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
