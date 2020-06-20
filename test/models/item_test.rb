# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  explanation :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :string
#  target      :string
#  genre       :string
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
