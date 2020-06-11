class AddQuizIdToRankings < ActiveRecord::Migration[6.0]
  def change
     add_reference :rankings, :quiz, index: true
  end
end
