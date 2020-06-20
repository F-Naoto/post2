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

class Item < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_many_attached :images
  # belongs_to :user, optional: true
validates :explanation, presence: true, length:{maximum:100}
validates :target, presence: true
validates :genre, presence: true
validates :content, presence: true
# createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
after_create_commit { MessageBroadcastJob.perform_later self }
end
