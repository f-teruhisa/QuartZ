class MemberOrganizationAssociation < ApplicationRecord
  belongs_to :member
  belongs_to :organization
end
