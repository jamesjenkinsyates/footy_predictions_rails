class GetScorers

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

  def perform
    puts "Getting Scorers..."
    ScorerFetcher.save_scorers
    puts "Done."
  end

end