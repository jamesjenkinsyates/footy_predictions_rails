namespace :db do
  task clear_matches: :environment do
    Match.all.each(&:destroy)
  end
end

namespace :get do
  task matches: :environment do
    puts "Getting Matches..."
    MatchFetcher.save_fixtures
    puts "Done."
  end
  task results: :environment do
    puts "Getting Results..."
    MatchFetcher.save_results
    puts "Done."
  end
  task scorers: :environment do
    puts "Getting Scorers..."
    ScorerFetcher.save_scorers
    puts "Done."
  end
end

namespace :background do
  task assign_points: :environment do
    puts "Assigning Points..."
    Prediction.assign_all_points
    User.assign_points_to_all_users
    puts "Done."
  end
  task give_new_credits: :environment do
    puts "Giving new doubles credits..."
    User.add_double_credits_to_users
    puts "Done."
  end
end
