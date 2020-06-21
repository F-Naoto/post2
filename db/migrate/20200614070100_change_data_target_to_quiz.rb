class ChangeDataTargetToQuiz < ActiveRecord::Migration[6.0]
  def change
    change_column :quizzes, :genre, :string
  end
end