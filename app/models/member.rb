class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :member_organization_associations, dependent: :destroy
  has_many :member_group_associations, dependent: :destroy
  has_many :organizations, through: :member_organization_associations
end
