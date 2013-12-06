class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :predictions

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end
    end

  end

  def prediction_for(match)
    predictions.find_by(match: match)
  end

  def match_predictions
    Match.all.map do |match|
      if has_predicted?(match)
        prediction_for(match)
      else
        Prediction.new(match: match, user: self)
      end
    end
  end

  alias_method :has_predicted?, :prediction_for

  def score_points predicted1, predicted2, actual1, actual2
    prediction = [predicted1, predicted2]
    actual = [actual1, actual2]
    return 3 if exact_match?(prediction, actual)
    return 1 if result_correct?(prediction, actual)
    0
  end

  def exact_match? prediction, actual
    (prediction[0] == actual[0]) && (prediction[1] == actual[1])
  end

  def result_correct? prediction, actual
    return true if draw?(*prediction) && draw?(*actual)
    return true if away_win?(*prediction) && away_win?(*actual)
    return true if home_win?(*prediction) && home_win?(*actual)
    false
  end

  def draw? home, away
    home-away == 0
  end

  def home_win? home, away
    home-away > 0
  end

  def away_win? home, away
    home-away < 0
  end

end
