Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %I[index show]
  resources :flats do
    resources :flat_users, only: %I[index new create]
  end

  resources :flat_users, only: %I[show edit update destroy]
end
