class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  mount_uploader :image_url, ImageUploader
  has_many :member_organization_associations, dependent: :destroy
  has_many :member_group_associations, dependent: :destroy
  has_many :organizations, through: :member_organization_associations

  scope :group_members, ->(group_id) {
    joins(:member_group_associations).where('member_group_associations.group_id = ?', group_id)
  }

  scope :organization_members, ->(organization_id) {
    joins(:member_organization_associations).where(
      'member_organization_associations.organization_id = ?', organization_id
    )
  }

  # For omuniauth member search method with uid & provider combination
  def self.find_for_oauth(auth)
    member = Member.find_by(uid: auth.uid, provider: auth.provider)

    member ||= Member.create(
      uid:      auth.uid,
      provider: auth.provider,
      email:    Member.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )

    member
  end

  # Search method for creating member_organization_association
  def self.search(search)
    return nil unless search
    Member.where(['email LIKE ?', "%#{search}%"])
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
