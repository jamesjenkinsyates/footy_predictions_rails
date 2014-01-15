class GroupsController < ApplicationController
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to dashboard_path
    else
      flash.now[:error] = "Group Creation Failed: #{@group.errors.full_messages}"
    end
  end
  
  def new
    @group = Group.new
  end
  
  private
    def group_params
      params.require(:group).permit(:user_id, :name)
    end
end
