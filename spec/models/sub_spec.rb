# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  name         :string(255)      not null
#  description  :text             not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Sub do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:moderator) }

  it { should belong_to(:moderator) }
  it { should have_many(:posts) }

  it 'associates with the correct moderator even before save via inverse_of' do
    user = FactoryGirl.build(:user)
    sub = user.subs.new(name: 'sub')
    expect(sub.moderator).to be(user)
  end
end
