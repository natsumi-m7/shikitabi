Rails.application.routes.draw do
  devise_for :users

  # post 'spots#create'
  get 'seasons/spring'
  get 'seasons/summer'
  get 'seasons/autumn'
  get 'seasons/winter'
  root 'spots#top'
  get '/', to: 'spots#top'
  # get '/spots/new', to: 'spots#new'
  # post '/spots', to: 'spots#create'
  resources :users,except:[:edit,:new,:create] do
    resource :relations,only:[:create,:destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :relationships,only: [:create, :destroy]
  resources :spots do
      resources :comments,only:[:create,:destroy]
      resource :favorites,only:[:create,:destroy]
      resources :went_spots,only:[:create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
