# frozen_string_literal: true

FactoryBot.define do
  factory :blog do
    content { 'MyBlog' }
    lat { '35.6581' }
    lng { '139.7017' }
    association :user

    factory :alice_blog do
      content { 'AliceBlog' }
      association :user, factory: :alice
    end

    factory :bob_blog do
      content { 'BobBlog' }
      association :user, factory: :bob
    end
  end
end
