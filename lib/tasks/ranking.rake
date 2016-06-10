namespace :ranking do
  desc 'update all rankings'
  task update_all: :environment do
    Ranking.update_all_rankings!
  end
end
