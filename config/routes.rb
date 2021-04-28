Rails.application.routes.draw do
  get 'urls/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :urls, only: [:index, :create]
end
