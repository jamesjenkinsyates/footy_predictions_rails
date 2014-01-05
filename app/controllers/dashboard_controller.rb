class DashboardController < ApplicationController
  before_filter :authenticate_user!


  def index 
    # @predictions = current_user.predictions
    # @predictions = Prediction.new
    @predictions = current_user.match_predictions

    @users = User.all.sort_by(&:total_points)
  end

  def history
    @predictions = current_user.predictions.past
  end

end
