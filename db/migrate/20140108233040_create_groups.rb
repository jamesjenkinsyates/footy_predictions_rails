class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :average_points, default: 0

      t.timestamps
    end
  end
end
