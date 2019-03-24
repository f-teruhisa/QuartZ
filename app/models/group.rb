class Group < ApplicationRecord
  belongs_to :lunch
  has_many :members, through: :member_group_association
  has_many :member_group_associations, dependent: :destroy

  def create_member_group_association!(member)
    member_group_association.create!(member_id: member.id)
  end
end
