class Prediction < ActiveRecord::Base
  # attr_accessible :home_prediction, :away_prediction

  belongs_to :user
  belongs_to :match

   validates :match_id, presence: true

end
