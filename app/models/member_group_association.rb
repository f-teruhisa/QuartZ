class MemberGroupAssociation < ApplicationRecord
  belongs_to :member
  belongs_to :group

  validates :member_id, presence: true, numericality: true
  validates :group_id, presence: true, numericality: true
end
