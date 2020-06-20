class AddGenreToQuiz < ActiveRecord::Migration[6.0]
  def change
    change_column :quizzes, :genre, :string
    change_column :quizzes, :target, :string
  end
end
