class Organization < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  has_many :members, through: :member_organization_associations
  has_many :member_organization_associations, dependent: :destroy
end
