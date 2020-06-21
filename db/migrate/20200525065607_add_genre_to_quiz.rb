class AddGenreToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :genre, :string
    add_column :quizzes, :target, :string
  end
end
