namespace :rubygem do
  desc 'fetch and save latest updated gems info'
  task latest_update: :environment do
    Rubygem.latest_update!
  end
end
