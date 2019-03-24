class Group < ApplicationRecord
  belongs_to :lunch
  has_many :member_group_association

  def create_member_group_association!(member)
      member_group_association.create!(member_id: member.id)
  end
end
