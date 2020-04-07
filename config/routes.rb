Rails.application.routes.draw do
  devise_for :users
  root to: 'complaints#index'
  get 'profile', to: 'pages#profile', as: :profile
  resources :complaints
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
