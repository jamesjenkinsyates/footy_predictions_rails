class GetScorers

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  def perform
    puts "Getting Scorers..."
    ScorerFetcher.save_scorers
    puts "Done."
  end

end