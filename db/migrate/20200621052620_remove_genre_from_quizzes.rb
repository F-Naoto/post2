class RemoveGenreFromQuizzes < ActiveRecord::Migration[6.0]
  def change
    remove_column :quizzes, :genre, :string
    remove_column :quizzes, :target, :string
  end
end
