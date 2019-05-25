FactoryBot.define do
  factory :group do
    image_url { Faker::Internet.url + '.png' }
    url { Faker::Internet.url }
    comment { Faker::Lorem }
    lunch { nil }
    rank { 0 }
  end
end
