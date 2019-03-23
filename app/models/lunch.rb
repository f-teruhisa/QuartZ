class Lunch < ApplicationRecord
  belongs_to :organization
  has_many :groups

  def create_groups!
    # TODO: Organizationごとにグループの数を設定できるようにする
    # TODO: グループの数を都度設定できるようにする
    7.times do
      groups.create!
    end
  end
end
