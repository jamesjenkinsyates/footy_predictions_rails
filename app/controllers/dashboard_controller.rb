class DashboardController < ApplicationController
  before_filter :authenticate_user!


  def index 
    @predictions = current_user.match_predictions
    @results = current_user.past_predictions
    @scorers = Scorer.all.map { |scorer| scorer.name }
    @others_predictions = others_predictions
    @users = User.all.sort_by(&:total_points)
    @groups = Group.all
  end
 
  
  def history
    @predictions = current_user.predictions.past
  end
  
  private
    def others_predictions
      User.all.map do |user| 
        unless user == current_user
          user.predictions.each do |prediction|
            prediction
          end  
        end
      end
    end

end
