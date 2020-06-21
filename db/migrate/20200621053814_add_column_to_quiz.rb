class AddColumnToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :genre, :integer
  end
end
