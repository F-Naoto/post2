# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  question   :text
#  choice_1   :text
#  choice_2   :text
#  choice_3   :text
#  choice_4   :text
#  answer     :integer
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre      :integer
#

class Quiz < ApplicationRecord
  belongs_to :user
  validates :user_id,  presence:true
  validates :question, presence:true, length:{maximum:50}
  validates :choice_1, presence:true, length:{maximum:30}
  validates :choice_2, presence:true, length:{maximum:30}
  validates :choice_3, presence:true, length:{maximum:30}
  validates :choice_4, presence:true, length:{maximum:30}
  validates :answer,   presence:true
  validates :genre,    presence:true
  default_scope -> { order(created_at: :desc) }
end
