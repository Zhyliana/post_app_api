# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  body              :text             not null
#  parent_comment_id :integer
#  post_id           :integer          not null
#  user_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:body) }

  it { should belong_to(:author) }
  it { should belong_to(:post) }
  it { should have_many(:child_comments) }

  it 'associates with the correct user before save via inverse_of' do
    author = FactoryGirl.build(:user)
    comment = author.comments.new
    expect(comment.author).to be(author)
  end

  it 'associates with the correct post before save via inverse_of' do
    post = FactoryGirl.build(:post)
    comment = post.comments.new
    expect(comment.post).to be(post)
  end
end
