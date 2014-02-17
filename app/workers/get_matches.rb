class GetMatches

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    puts "Getting Matches..."
    MatchFetcher.save_fixtures
    puts "Done."
  end

end