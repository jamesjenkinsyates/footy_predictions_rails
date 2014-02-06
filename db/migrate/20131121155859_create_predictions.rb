class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :home_prediction
      t.integer :away_prediction
      t.string :first_goalscorer
      t.boolean :double, default: false
      t.integer :user_id
      t.integer :match_id

      t.timestamps
    end
  end
end
