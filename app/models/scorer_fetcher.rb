module ScorerFetcher
  def self.save_scorers
    json = get_scorers
    json.each do |scorer|
      Player.where(player_id: scorer["player_id"], name: scorer["playershort"], team: scorer["teamshort"], team_id: scorer["team_id"]).find_or_create_by(player_id: scorer["player_id"])
    end
  end

  def self.get_scorers
    scorers = "http://api.statsfc.com/top-scorers.json?key=#{ENV['STATS_FC_SECRET']}&competition=premier-league&limit=10000"
    json_get(scorers)
  end
  
  
  private
    def self.json_get(url)
      JSON.parse HTTParty.get(url).response.body
    end
end