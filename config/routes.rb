Rails.application.routes.draw do
  namespace :admin do
    get 'suggestions/update'
  end

  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/signout' => 'sessions#destroy', as: :logout

  resources :rubygems do
    resources :suggestions, only: :create
  end
  resources :categories
  namespace :api do
    resources :categories, only: :index
  end
  resources :admin
  namespace :admin do
    resources :suggestions, only: :update
  end
end
