Rails.application.routes.draw do
  get 'admin/index'

  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/signout' => 'sessions#destroy', as: :logout

  resources :rubygems do
    resources :suggestions, only: :create
  end
  resources :categories
end
