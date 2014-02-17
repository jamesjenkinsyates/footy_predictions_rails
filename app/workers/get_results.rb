class GetResults

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  def perform
    puts "Getting Results..."
    MatchFetcher.save_results
    puts "Done."
  end

end