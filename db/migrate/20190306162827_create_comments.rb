class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :spot_id
      t.string :contents_text

      t.timestamps
    end
  end
end
