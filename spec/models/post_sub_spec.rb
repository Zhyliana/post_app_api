# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe PostSub do
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:sub) }

  it { should belong_to(:post) }
  it { should belong_to(:sub) }

  it 'associates with the correct sub before save via inverse_of' do
    sub = FactoryGirl.build(:sub)
    post_sub = sub.post_subs.new
    expect(post_sub.sub).to be(sub)
  end

  it 'associates with the correct post before save via inverse_of' do
    post = FactoryGirl.build(:post)
    post_sub = post.post_subs.new
    expect(post_sub.post).to be(post)
  end
end
