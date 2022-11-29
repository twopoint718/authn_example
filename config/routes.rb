Rails.application.routes.draw do
  namespace :two_factor_authentication do
    resource :challenge, only: [:new, :create]
    resource :totp,      only: [:new, :create]
  end
  get  'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get  'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:edit, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
  get 'home/index'
  root 'home#index'
end
