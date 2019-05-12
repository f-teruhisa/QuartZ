FactoryBot.define do
  factory :member_organization_association do
    association :member
    association :organization
    organizer { false }
  end
end
