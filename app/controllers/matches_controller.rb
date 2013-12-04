class MatchesController < ApplicationController

  # def new
  #   @match = Match.new
  # end

  # def create
  #   @match = Match.new(match_params)
  #   if @match.save
  #     redirect_to @match
  #   else
  #     @matches = Match.all
  #     render 'new'
  #   end
  # end

  def show
    @match = Match.find(params[:id])
  end



  private
    def match_params
      params.require(:match).permit(:home_team, :away_team, :match_date_time, :api_match_id)
    end

end
