FactoryBot.define do
  factory :member do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    image_url { Faker::Internet.url + '.png' }
    password { Faker::Lorem.characters(60) }
  end
end
