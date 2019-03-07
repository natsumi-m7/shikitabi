Rails.application.routes.draw do
  get 'seasons/show'
  root 'spots#top'
  devise_for :users
  get '/', to: 'spots#top'
  resources :users
  resources :seasons,only:[:show] do
    resources :spots do
      resources :comments,only:[:create,:destroy]
      resource :favorites,only:[:create,:destroy]
      resources :went_spots,only:[:create,:destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
