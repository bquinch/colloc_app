Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %I[index show]
  resources :flats do
    resources :flat_users, only: %I[index]
    resources :events, only: :create
  end

  resources :flat_users, only: %I[show new create edit update destroy]
  resources :events, only: %I[show new edit update destroy] do
    resources :participations, only: :create
  end
  resources :participations, only: :destroy
end
