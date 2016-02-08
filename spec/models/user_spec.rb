# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  city            :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.build(:user, name: 'buster', password: 'good_password') }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should ensure_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:posts) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  it 'creates a password digest when a password is given' do
    expect(user.password_digest).to_not be_nil
  end

  it 'creates a session token before validation' do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe '#reset_session_token!' do
    it 'sets a new session token on the user' do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it 'returns the new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe '#is_password?' do
    it 'verifies a password is correct' do
      expect(user.is_password?('good_password')).to eq(true)
    end

    it 'verifies a password is not correct' do
      expect(user.is_password?('bad_password')).to eq(false)
    end
  end

  describe '.find_by_credentials' do
    before { user.save! }

    it 'returns user given good credentials' do
      expect(User.find_by_credentials('buster', 'good_password')).to eq(user)
    end

    it 'returns nil given bad credentials' do
      expect(User.find_by_credentials('buster', 'bad_password')).to eq(nil)
    end
  end
end
