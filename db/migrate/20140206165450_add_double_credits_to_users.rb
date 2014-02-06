class AddDoubleCreditsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :double_credits, :integer, default: 0
  end
end
