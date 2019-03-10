class MemberGroupAssociation < ApplicationRecord
  belongs_to :member
  belongs_to :group
end
