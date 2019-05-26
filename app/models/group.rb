class Group < ApplicationRecord
  mount_uploader :image_url, ImageUploader

  belongs_to :lunch
  has_many :members, through: :member_group_association
  has_many :member_group_associations, dependent: :destroy

  validates :lunch_id, presence: true, numericality: true
  validates :rank, presence: true, uniqueness: true, numericality: true

  def create_member_group_association!(member)
    member_group_associations.create!(member_id: member.id)
  end
end
