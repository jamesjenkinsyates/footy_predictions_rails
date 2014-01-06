FactoryGirl.define do
  factory :prediction, class: Prediction do
    home_prediction 2
    away_prediction 1
    match_id 1
    user_id 1
  end

  factory :correct_prediction, class: Prediction do
    home_prediction 1
    away_prediction 0
    match_id 1
    user_id 1
  end

  factory :incorrect_prediction, class: Prediction do
    home_prediction 0
    away_prediction 1
    match_id 1
    user_id 1
  end
end