FactoryBot.define do
  factory :like do
    association :user, factory: :alice
    association :blog, factory: :bob_blog
  end
end
