FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    first_name { "Anna" }
    trait :last_name do
      last_name { "Banana" }
    end
  end
end
