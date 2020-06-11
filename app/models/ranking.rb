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
#

class Ranking < ApplicationRecord
belongs_to :user
belongs_to :quiz
validates :correct, presence:true
validates :total_correct, presence:true
end
