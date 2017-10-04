Rails.application.routes.draw do

  devise_for :users
  resources :posts, only: [:show, :index]
  resources :tags, only: [:show]

  root 'posts#index'

  namespace :admin do
    resources :posts, except: [:show, :index]
    resources :pictures, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
