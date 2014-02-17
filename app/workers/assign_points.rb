class AssignPoints

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  def perform
    puts "Assigning Points..."
    Prediction.assign_all_points
    User.assign_points_to_all_users
    puts "Done."
  end

end