class Lunch < ApplicationRecord
  belongs_to :organization
  has_many :groups

  def create_group_with_rank!(rank)
      groups.create!(rank: rank)
  end
end
