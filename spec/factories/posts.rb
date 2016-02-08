# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :post do
    url 'http://i.imgur.com/0QZBN2C.jpg'
    title 'Snorty life'
    content 'Team Tuff'

    association :author, factory: :user
  end
end
