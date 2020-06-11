class AddTotalCorrectToRanking < ActiveRecord::Migration[6.0]
  def change
    add_column :rankings, :total_correct, :integer
  end
end
