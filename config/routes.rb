Rails.application.routes.draw do
  get 'page/index'

  get 'services/index'

  get 'about/index'

  resources :posts

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
