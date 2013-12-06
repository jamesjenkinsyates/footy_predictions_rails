class DashboardController < ApplicationController

  def index 
    @predictions = current_user.predictions
  end

  def history
    @predictions = current_user.predictions.past
  end

end
