class CreateScorers < ActiveRecord::Migration
  def change
    create_table :scorers do |t|
      t.string :name
      t.string :team
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
  end
end
