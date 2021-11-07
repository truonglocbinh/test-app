FactoryBot.define do
  factory :post do
    body { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'image.jpg'), 'image/jpg') }

    trait :association do
      association :user, factory: :user, email: Faker::Internet.email
    end

    trait :invalid do
      body { '' }
      image { nil }
    end
  end
end
