# == Schema Information
#
# Table name: rankings
#
#  id         :integer          not null, primary key
#  correct    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ranking < ApplicationRecord
belongs_to :user
validates :correct, presence:true
end
