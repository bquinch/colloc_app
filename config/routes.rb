Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %I[index show]
  resources :flats do
    get 'day', to: 'pages#day'
    resources :flat_users, only: %I[index]
  end

  resources :flat_users, only: %I[show new create edit update destroy]
  resources :events, only: %I[show new edit create update destroy] do
    resources :participations, only: :create
  end
  resources :participations, only: :destroy
  resources :notes, only: %I[show new edit create update destroy] do
    resources :note_answers, only: :create
  end

  resources :note_answers, only: %I[new edit update destroy]
end
