class DashboardController < ApplicationController

  def index 
    @predictions = Prediction.all#.past
  end

end
