FactoryBot.define do
  factory :lunch, class: Lunch do
    association :organization,
                factory: :organization
  end
end
