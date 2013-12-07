FactoryGirl.define do
  factory :match, class: Match do
    home_team "Man United"
    away_team "Newcastle"
    home_score 1
    away_score 0
    match_date_time "2013-12-07 12:45:00"
    id 1
  end
end
