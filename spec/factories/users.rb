FactoryBot.define do
  factory :user do
    name { "tester" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }

    factory :alice do
      name { "Alice" }
      email { "alice@example.com" }
    end

    factory :bob do
      name { "Bob" }
      email { "bob@example.com" }
    end
  end
end
