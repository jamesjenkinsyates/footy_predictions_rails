class AddGoalsToScorer < ActiveRecord::Migration
  def change
    add_column :scorers, :goals, :integer
  end
end
