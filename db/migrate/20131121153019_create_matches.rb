class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.integer :home_score
      t.integer :away_score
      t.string :first_goalscorer
      t.datetime :match_date_time

      t.timestamps
    end
  end
end
