module MatchFetcher

 def self.get_fixtures
    todays_date = Time.now.to_date
    date_now = todays_date.strftime('%Y-%m-%d')
    date_to = (todays_date + 14.days).strftime('%Y-%m-%d')
    fixtures = "http://api.statsfc.com/fixtures.json?key=#{ENV['STATS_FC_SECRET']}&competition=premier-league&from=#{date_now}&to=#{date_to}"
    json_get(fixtures)
  end

  def self.save_fixtures
    json = get_fixtures
    json.each do |fixture|
      Match.where(api_match_id: fixture["id"].to_i, match_date_time: fixture["date"], api_home_id: fixture["home_id"], home_team: fixture["homeshort"], api_away_id: fixture["away_id"], away_team: fixture["awayshort"]).find_or_create_by(api_match_id: fixture["id"])
    end
  end

  def self.get_results
    todays_date = Time.now.to_date
    date_from = (todays_date - 7.days).strftime('%Y-%m-%d')
    date_to = todays_date.strftime('%Y-%m-%d')
    results = "http://api.statsfc.com/results.json?key=#{ENV['STATS_FC_SECRET']}&competition=premier-league&from=#{date_from}&to=#{date_to}"
    json_get(results)
  end

  def self.save_results
    json = get_results
    json.each do |result|
      score = result["fulltime"]
      goal = result['incidents'].detect { |incidents| incidents['goaltype'] != nil }
      if goal.nil?
        first_goalscorer_player_name = "No Goal Scorer" 
      else
        first_goalscorer_player_name = goal["playershort"]
      end
      
      match = Match.find_by(api_match_id: result["id"])
      match.update(home_score: score[0], away_score: score[1], first_goalscorer: first_goalscorer_player_name)
      puts match.inspect
      
      
    end
  end

  private
    def self.json_get(url)
      JSON.parse HTTParty.get(url).response.body
    end
end