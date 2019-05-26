require 'rails_helper'

RSpec.describe MemberOrganizationAssociation, type: :model do
  describe 'member validates' do
    it 'is invalid without organization_id' do
      @member_organization_association = MemberOrganizationAssociation.new(organization_id: nil)
      expect(@member_organization_association.valid?).to eq(false)
    end

    it 'is invalid without member_id' do
      @member_organization_association = MemberOrganizationAssociation.new(member_id: nil)
      expect(@member_organization_association.valid?).to eq(false)
    end

    it 'is invalid without setting organizer' do
      @member_organization_association = MemberOrganizationAssociation.new(organizer: nil)
      expect(@member_organization_association.valid?).to eq(false)
    end
  end
end
