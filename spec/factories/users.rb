FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }

    factory :alice do
      email { "alice@example.com" }
    end
  end
end
