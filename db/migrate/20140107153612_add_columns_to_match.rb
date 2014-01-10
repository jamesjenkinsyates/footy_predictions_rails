class AddColumnsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :api_home_id, :integer
    add_column :matches, :api_away_id, :integer
  end
end
