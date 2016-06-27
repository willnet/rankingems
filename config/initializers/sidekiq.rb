redis_url = if Rails.env.production?
              ENV['REDIS_URL']
            else
              'redis://localhost:6379'
            end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end
