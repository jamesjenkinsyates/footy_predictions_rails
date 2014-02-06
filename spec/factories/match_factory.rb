FactoryGirl.define do
  factory :match, class: Match do
    home_team "Man United"
    away_team "Newcastle"
    home_score 1
    away_score 0
    first_goalscorer "W. Rooney"
    match_date_time (DateTime.now+1.day)
    id 1
  end
end
