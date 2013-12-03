class AddApiMatchIdFromMatches < ActiveRecord::Migration
  def change
    add_column :matches, :api_match_id, :integer
  end
end
