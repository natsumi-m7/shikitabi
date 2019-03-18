class AddAverageStarToSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :average_star, :float, default: 0.0
  end
end
