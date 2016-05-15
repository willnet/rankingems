namespace :rubygem do
  desc 'fetch and save latest updated gems info'
  task save_latest_update: :environment do
    Rubygem.latest_update!
  end

  task update_download_count: :environment do
    Rubygem.update_download_count_for_ranking!
  end
end
