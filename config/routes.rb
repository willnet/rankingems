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
    root 'welcome#index', as: :root
    resources :suggestions, only: %i(index update)
    resources :categories
    resources :rubygems
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new
end
