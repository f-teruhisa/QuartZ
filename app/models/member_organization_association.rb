class MemberOrganizationAssociation < ApplicationRecord
  belongs_to :member
  belongs_to :organization

  validates :member_id, presence: true, numericality: true
  validates :organization_id, presence: true, numericality: true
  validates :organizer, inclusion: { in: [true, false] }
end
