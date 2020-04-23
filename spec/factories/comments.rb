FactoryBot.define do
  factory :comment do
    association :blog
    association :user
    content { "MyComment" }
  end
end
