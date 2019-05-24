require 'rails_helper'
require 'login_helper'

describe LunchController, type: :controller do
  include_context 'logged_in'
  let(:organization) { create(:organization) }

  describe '#index' do
    context 'normal' do
      let(:params) { {organization_id: organization.id} }
      let(:lunch) { create(:lunch, organization_id: organization.id ) }

      it 'return status 200' do
        get :index, params: params
        expect(response.status).to eq(200)
      end

      it 'assigns resouces' do
        get :index, params: params
        expect(assigns(:organization)).to eq organization
        expect(assigns(:lunches)).to contain_exactly lunch
      end

      it 'return index template' do
        get :index, params: params
        expect(response).to render_template :index
      end
    end

    context 'normal' do
      let(:params) { {organization_id: organization.id.to_i + 1} }

      it 'return status 200' do
        expect {
          get :index, params: params
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
