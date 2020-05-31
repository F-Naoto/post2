class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.string :correct
      t.references :user

      t.timestamps
    end
  end
end
