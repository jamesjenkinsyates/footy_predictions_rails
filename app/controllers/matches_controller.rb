class MatchesController < ApplicationController

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
  end

  private
    def match_params
      params.require(:match).permit(:home_team, :away_team, :match_date_time)
    end
end
