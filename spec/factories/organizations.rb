FactoryBot.define do
  factory :organization do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    image_url { Faker::Internet.url + '.png' }
    text { Faker::Lorem.sentence }
    numbers_of_groups { Faker::Number.number(1) }
  end
end
