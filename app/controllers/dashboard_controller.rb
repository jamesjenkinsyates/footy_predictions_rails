class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index 
    @predictions = current_user.match_predictions
    @results = @results = current_user.past_predictions || []
    @scorers = Scorer.all.map { |scorer| scorer.name }
    @others_predictions = group_members_with_predictions
    @users = User.all.sort_by(&:total_points).reverse
    @groups = Group.all
    @users_group = user_group(current_user)
  end
  
  def join_group
    group = Group.find(params[:id])
    current_user.update(group_id: group.id)
    redirect_to dashboard_path
  end
      
  def history
    @predictions = current_user.predictions.past
  end
  
  private
    def group_members_with_predictions
      user_group = current_user.group_id
      users_in_group = User.where(group_id: user_group)
      users_array = users_in_group.map do |user| 
        user
        predictions_array = user.predictions.map do |prediction| 
          prediction
        end
        [user, predictions_array]
      end
    end
  
  def user_group user
    if user.group != nil
      return "Your current group: #{user.group.name}"
    else
      return "You are not currently a member of a group"
    end
  end
end