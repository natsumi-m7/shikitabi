class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :season_name, limit: 1, default: 0

      t.timestamps
    end
  end
end
