FactoryBot.define do
  factory :member_organization_association do
    association :member
    association :organization
  end
end
