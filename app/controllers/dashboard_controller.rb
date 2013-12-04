class DashboardController < ApplicationController

  def index 
    @predictions = current_user.predictions
    # @predictions = Prediction.where(current_user).past
  end

end
