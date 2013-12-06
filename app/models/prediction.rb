class Prediction < ActiveRecord::Base
  # attr_accessible :home_prediction, :away_prediction

  belongs_to :user
  belongs_to :match

  validates :match_id, uniqueness: {scope: :user_id}, presence: true
  validates :user_id, presence: true

  scope :past, -> {joins(:match).where('match_date_time < ?', DateTime.now)}
  scope :future, -> {joins(:match).where('match_date_time > ?', DateTime.now)}
  scope :finished, -> {joins(:match).where('match_date_time < ?', DateTime.now+3.hours)}


end
