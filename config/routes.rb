Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'auths#create'
  get '/auth/failure' => 'auths#failure'
  get '/logout' => 'auths#destroy', as: :logout
end
