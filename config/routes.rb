Rails.application.routes.draw do


  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :edit, :update, :destroy]
  end

end
