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


  def get_fixtures
    fixtures = "http://api.statsfc.com/results.json?key=XxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx&competition=premier-league&year=2013/2014&from=2013-11-02&to=2013-11-24"
    json_get(fixtures)
  end

  def save_fixtures
    json = get_fixtures
    json.each do |fixture|
      Match.where(api_match_id: fixture["id"], match_date_time: fixture["date"], home_team: fixture["homeshort"], away_team: fixture["awayshort"]).find_or_create_by(api_match_id: fixture["id"])
    end
  end

  def get_results
    results = "http://api.statsfc.com/results.json?key=XxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx&competition=premier-league&year=2013/2014&from=2013-11-02&to=2013-11-24"
    json_get(results)
  end

  def save_results
    json = get_results
    json.each do |result|
      score = result["fulltime"]
      goals = result['incidents'].select do |incidents|
        incidents['goaltype'] != nil
      end
      
      if goals.count >= 1
        first_goalscorer_player_name = goals.first['playershort'] 
      else 
        first_goalscorer_player_name = "No Goal Scorer"
      end
      Match.where(home_score: score[0], away_score: score[1], first_goalscorer: first_goalscorer_player_name).find_by(api_match_id: result["id"])
    end
  end

  private
    def match_params
      params.require(:match).permit(:home_team, :away_team, :match_date_time, :api_match_id)
    end

    def json_get(url)
      JSON.parse HTTParty.get(url).response.body
    end
end
