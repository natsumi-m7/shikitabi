class RemoveUserimageFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :userimage, :string
  end
end
