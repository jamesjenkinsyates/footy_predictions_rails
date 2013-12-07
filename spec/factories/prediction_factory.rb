FactoryGirl.define do
  factory :prediction, class: Prediction do
    home_prediction 2
    away_prediction 1
    match_id 1
  end
end