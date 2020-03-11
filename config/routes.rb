Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %I[index show]
  resources :flats do
    resources :flat_users, only: %I[index]
  end

  resources :flat_users, only: %I[show new create edit update destroy]
end
