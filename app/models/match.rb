class Match < ActiveRecord::Base
  has_many :predictions

  def match_finished?
    
  end

end
