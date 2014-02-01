class Match < ActiveRecord::Base
  has_many :predictions

  def match_finished?
    (self.match_date_time + 3.hours) <= DateTime.now
  end
end
