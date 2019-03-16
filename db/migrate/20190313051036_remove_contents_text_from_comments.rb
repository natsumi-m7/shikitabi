class RemoveContentsTextFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :contents_text, :string
  end
end
