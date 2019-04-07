class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image_url, ImageUploader
  has_many :member_organization_associations, dependent: :destroy
  has_many :member_group_associations, dependent: :destroy
  has_many :organizations, through: :member_organization_associations

  scope :group_members, ->(group_id) {
    joins(:member_group_associations).where('member_group_associations.group_id = ?', group_id)
  }

  scope :organization_members, ->(organization_id) {
    joins(:member_organization_associations).where('member_organization_associations.organization_id = ?', organization_id)
  }
end
