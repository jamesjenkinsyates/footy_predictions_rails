class DashboardController < ApplicationController

  def index 
    # @predictions = current_user.predictions
    @users = User.all.sort_by(&:total_points)
  end

  def history
    @predictions = current_user.predictions.past
  end

end
