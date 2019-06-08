require 'rails_helper'

RSpec.describe MemberGroupAssociation, type: :model do
  describe 'member group validates' do
    it 'is invalid without member_id' do
      @member_group_association = MemberGroupAssociation.new(member_id: nil)
      expect(@member_group_association.valid?).to eq(false)
    end

    it 'is invalid without group_id' do
      @member_group_association = MemberGroupAssociation.new(group_id: nil)
      expect(@member_group_association.valid?).to eq(false)
    end
  end
end
