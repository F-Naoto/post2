class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :question
      t.text :choice_1
      t.text :choice_2
      t.text :choice_3
      t.text :choice_4
      t.integer :answer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
