FactoryBot.define do
  factory :comment do
    association :blog
    content { "MyComment" }
  end
end
