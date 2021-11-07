FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "contact-#{n}@example.com" }
    sequence(:name) { |n| "Account #{n}" }
    password { 'password' }
  end
end
