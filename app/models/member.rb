class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :member_organization_associations, dependent: :destroy
  has_many :member_group_associations, dependent: :destroy
  has_many :organizations, through: :member_organization_associations

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

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
      email:    auth.info.email,
      name:     auth.info.name,
      image_url: "http://graph.facebook.com/#{auth.uid}/picture?type=large",
      password: Devise.friendly_token[0, 20]
    )

    member
  end

  # Search method for creating member_organization_association
  def self.search(search)
    return nil unless search
    Member.where(['email LIKE ?', "%#{search}%"])
  end
end
