Rails.application.routes.draw do
  devise_for :users
  root to: 'complaints#index'
  get 'profile', to: 'pages#profile', as: :profile
  get 'reports', to: 'pages#reports', as: :reports

  resources :complaints, except: :destroy do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
