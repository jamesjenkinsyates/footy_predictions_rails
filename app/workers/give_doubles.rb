class GiveDoubles

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    puts "Giving new doubles credits..."
    User.add_double_credits_to_users
    puts "Done."
  end

end