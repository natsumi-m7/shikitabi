Rails.application.routes.draw do
  root 'spots#top'
  devise_for :users
  get '/', to: 'spots#top'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'went_spots/create'
  get 'went_spots/destroy'
  get 'comments/create'
  get 'comments/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  resources :spots

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
