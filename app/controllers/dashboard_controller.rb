class DashboardController < ApplicationController

  def index 
    @predictions = current_user.predictions.past
  end

end
