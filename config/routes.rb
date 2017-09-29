Rails.application.routes.draw do

  resources :pictures, only: [:create, :destroy]
  resources :posts
  resources :tags, only: [:show]

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
