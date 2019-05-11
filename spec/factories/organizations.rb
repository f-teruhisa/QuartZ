FactoryBot.define do
  factory :organization do
    name { Faker::Name.name +'Co., Ltd.' }
    url { Faker::Internet.url }
    image_url { Faker::Internet.url + '.png' }
    text { Faker::Lorem.sentence }
  end
end
