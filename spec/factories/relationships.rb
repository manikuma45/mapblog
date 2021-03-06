# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    association :follower, factory: :alice
    association :followed, factory: :bob
  end
end
