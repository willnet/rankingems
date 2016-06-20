Rails.application.routes.draw do
  root 'welcome#index'
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
  resource :search
  namespace :admin do
    root 'welcome#index'
    resources :suggestions, only: %i(index update)
    resources :categories
  end
end
