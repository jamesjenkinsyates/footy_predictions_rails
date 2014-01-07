# namespace :populater do

#   desc "fixture schedule scrape"
#     task schedule: :environment do
#       teams_array = YAML::load( File.open( 'teamnames.yml' ) )
#       teams_array.each do |team|
#         sched = Schedule.new(team)
#         sched.save
#       end
#     end
#   end

# end


namespace :db do
  task clear_matches: :environment do
    Match.all.each(&:destroy)
  end
end

namespace :get do
  task matches: :environment do
    MatchFetcher.save_fixtures
  end
  task results: :environment do
    MatchFetcher.save_results
  end
  task scorers: :environment do
    ScorerFetcher.save_scorers
  end
end

