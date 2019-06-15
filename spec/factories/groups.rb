FactoryBot.define do
  factory :group do
    image_url { Faker::Internet.url + '.png' }
    url { Faker::Internet.url }
    comment { Faker::Lorem }
    rank { 0 }
    association :lunch,
                factory: :lunch
  end
end
