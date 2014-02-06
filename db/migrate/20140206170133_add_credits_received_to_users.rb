class AddCreditsReceivedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credits_received, :integer, default: 0
  end
end
