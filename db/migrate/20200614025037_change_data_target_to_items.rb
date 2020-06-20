class ChangeDataTargetToItems < ActiveRecord::Migration[6.0]
  def change
  change_column :items, :target, :string
  change_column :items, :genre,  :string
  end
end
