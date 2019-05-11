require 'rails_helper'

describe MemberOrganizationAssociationController, type: :controller do
  let(:member) { create(:member) }
  let(:organization) { create(:organization) }
  describe '#create' do
    context 'normal' do
      let(:params) { { member_id: member.id, organization_id: organization.id } }

      it 'MemberOrganizationAssociations are created' do
        expect { post :create, params: params }.to change { MemberOrganizationAssociation.count }.by(1)
      end
    end
  end
end
