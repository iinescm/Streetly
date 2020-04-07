Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: :profile
  get 'home', to: 'pages#home', as: :home
  resources :complaints
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
