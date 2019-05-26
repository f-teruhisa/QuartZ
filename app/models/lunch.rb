class Lunch < ApplicationRecord
  belongs_to :organization
  has_many :groups, dependent: :destroy

  validates :organization_id, presence: true, numericality: true

  def create_group_with_rank!(rank)
    groups.create!(rank: rank)
  end
end
