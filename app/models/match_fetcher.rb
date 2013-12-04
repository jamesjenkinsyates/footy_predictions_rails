module MatchFetcher

 def self.get_fixtures
    todays_date = Time.now.to_date
    date_now = todays_date.strftime('%Y-%m-%d')
    date_to = (todays_date + 7.days).strftime('%Y-%m-%d')
    fixtures = "http://api.statsfc.com/fixtures.json?key=xCblZHPfB4JuU2FhN1RFvyEShLf_LwC15R2Qhz4F&competition=premier-league&from=#{date_now}&to=#{date_to}"
    json_get(fixtures)
  end

  def self.save_fixtures
    json = get_fixtures
    json.each do |fixture|
      Match.where(api_match_id: fixture["id"], match_date_time: fixture["date"], home_team: fixture["homeshort"], away_team: fixture["awayshort"]).find_or_create_by(api_match_id: fixture["id"])
    end
  end

  def self.get_results
    results = "http://api.statsfc.com/results.json?key=xCblZHPfB4JuU2FhN1RFvyEShLf_LwC15R2Qhz4F&competition=premier-league&from=2013-11-02&to=2013-11-24"
    json_get(results)
  end

  def self.save_results
    json = get_results
    json.each do |result|
      score = result["fulltime"]
      goal = result['incidents'].detect {|incidents| incidents['goaltype'] != nil }

      first_goalscorer_player_name = "No Goal Scorer" if goal.empty?
      first_goalscorer_player_name = goal

      Match.where(home_score: score[0], away_score: score[1], first_goalscorer: first_goalscorer_player_name).find_by(api_match_id: result["id"])
    end
  end

  private
    def self.json_get(url)
      JSON.parse HTTParty.get(url).response.body
    end
end