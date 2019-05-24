require 'rails_helper'

describe MemberOrganizationAssociationController, type: :controller do
  let(:member) { create(:member) }
  let(:organization) { create(:organization) }

  describe '#index' do
    context 'normal' do
      let(:params) { { organization_id: organization.id } }
      let(:member_organization_association) do
        {
          member_id: member.id,
          organization_id: organization.id
        }
      end

      it 'return 200 status response' do
        get :index, params: params
        expect(response.status).to eq(200)
      end

      it 'assign resources' do
        get :index, params: params
        expect(assigns(:organization)).to eq organization
      end

      it 'return index template' do
        get :index, params: params
        expect(response).to render_template :index
      end
    end
  end
  describe '#create' do
    context 'normal' do
      let(:params) { { member_id: member.id, organization_id: organization.id } }

      it 'MemberOrganizationAssociations are created' do
        expect { post :create, params: params }.to change { MemberOrganizationAssociation.count }.by(1)
      end
    end
  end
end
