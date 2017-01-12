git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

source 'https://rubygems.org'

ruby '2.3.3'

gem 'rails', '>= 5.0.0.1'
gem 'pg'
gem 'puma'
gem 'hamlit-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5.0'
gem 'jbuilder', '~> 2.0'
gem 'gems'
gem 'omniauth'
gem 'omniauth-github'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'rambulance', github: 'yuki24/rambulance'
gem 'rack-dev-mark'
gem 'font-awesome-sass'
gem 'friendly_id', '~> 5.1.0'
gem 'rollbar'
gem 'sidekiq'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'sinatra', github: 'sinatra/sinatra', require: false
gem 'letsencrypt_rack'
gem 'letsencrypt_heroku', require: false
gem 'json-jwt', '1.5.2'
gem 'rack-canonical-host'
gem 'honobono', github: 'willnet/honobono'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.5'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
end
