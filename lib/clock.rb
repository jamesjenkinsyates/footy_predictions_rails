require_relative "../config/environment"
require_relative "../config/boot"
require 'clockwork'
module Clockwork
  # include Clockwork
  handler do |job|
   puts "running #{job}."
  end

  every(12.hours, 'Get new matches'){`rake get:matches`; puts "Got matches" }
  every(30.minutes, 'Get results'){`rake get:results`; puts "Got results" }
  every(1.day, 'Get scorers'){`rake get:scorers`; puts "Got scorers" }
  every(30.minutes, 'Assign all points'){ Prediction.assign_all_points; puts "Assigned Points" }

end