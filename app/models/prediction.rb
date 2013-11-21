class Prediction < ActiveRecord::Base

  belongs_to :user

  # def score_points predicted1, predicted2, actual1, actual2
  #   prediction = [predicted1, predicted2]
  #   actual = [actual1, actual2]
  #   return 3 if exact_match?(prediction, actual)
  #   return 1 if result_correct?(prediction, actual)
  #   0
  # end

  # def exact_match? prediction, actual
  #   (prediction[0] == actual[0]) && (prediction[1] == actual[1])
  # end

  # def result_correct? prediction, actual
  #   return true if draw?(*prediction) && draw?(*actual)
  #   return true if away_win?(*prediction) && away_win?(*actual)
  #   return true if home_win?(*prediction) && home_win?(*actual)
  #   false
  # end

  # def draw? home, away
  #   home-away == 0
  # end

  # def home_win? home, away
  #   home-away > 0
  # end

  # def away_win? home, away
  #   home-away < 0
  # end


end
