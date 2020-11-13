Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :registrations, only: [:new, :create]
  resources :characters, only: [:index, :show]
  resources :episodes, only: [:index, :show]
end
