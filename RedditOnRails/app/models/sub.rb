# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
  validates :title, presence: true
  validates :moderator_id, presence: true
  validates :title, uniqueness: { scope: :moderator_id }
end
