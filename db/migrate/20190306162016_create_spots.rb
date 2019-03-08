class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.text :spot_image_id
      t.string :spot_name, null: false
      t.text :description, null: false
      t.integer :season, limit: 1, default: 0
      t.integer :prefecture, limit: 1, default: 0
      t.text :spot_address

      t.timestamps
    end
  end
end
