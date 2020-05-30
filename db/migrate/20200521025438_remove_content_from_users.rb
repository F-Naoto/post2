class RemoveContentFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :content, :text
  end
end
