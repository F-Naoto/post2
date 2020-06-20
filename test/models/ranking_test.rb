# == Schema Information
#
# Table name: rankings
#
#  id            :integer          not null, primary key
#  correct       :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  total_correct :integer
#  quiz_id       :integer
#

require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
