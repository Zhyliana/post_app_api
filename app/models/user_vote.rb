# == Schema Information
#
# Table name: user_votes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  value        :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#  votable_id   :integer          not null
#  votable_type :string(255)      not null
#

class UserVote < ActiveRecord::Base
  validates :user, :votable, presence: true
  # don't let the user vote twice!
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

  belongs_to :votable, polymorphic: true
  belongs_to :user, inverse_of: :user_votes
end
