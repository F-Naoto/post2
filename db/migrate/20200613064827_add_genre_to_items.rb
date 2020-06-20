class AddGenreToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :target, :integer
    add_column :items, :genre, :integer
    rename_column :items, :name, :explanation
  end
end
