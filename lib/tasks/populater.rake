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