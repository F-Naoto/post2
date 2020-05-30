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

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
