class RemoveMatchIdFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :match_id, :integer
  end
end
