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

require 'spec_helper'

describe UserVote do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:votable) }

  it { should belong_to(:votable) }
  it { should belong_to(:user) }

  it 'associates with the correct user before save via inverse_of' do
    user = FactoryGirl.build(:user)
    user_vote = user.user_votes.new
    expect(user_vote.user).to be(user)
  end
end
