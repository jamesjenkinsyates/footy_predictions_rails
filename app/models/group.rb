class Group < ActiveRecord::Base
  has_many :users
  
  def member_count 
    users.count
  end
  
  def average_points
    total_points_array = users.map do |user|
      user.total_points
    end
    total_points = total_points_array.inject(:+)
    unless total_points == nil 
      return total_points / member_count
    else
      return 0
    end
  end
end