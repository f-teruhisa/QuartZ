require 'rails_helper'
require 'login_helper'

describe LunchController, type: :controller do
  include_context 'logged_in'
  let(:organization) { create(:organization) }

  describe '#index' do
    context 'normal' do
      let(:params) { {organization_id: organization.id} }
      it 'return status 200' do
        get :index, params: params
        expect(response.status).to eq(200)
      end

      it 'assigns resouces' do
        get :index, params: params
        expect(assigns(:organization)).to eq organization
      end

      it 'return index template' do
        get :index, params: params
        expect(response).to render_template :index
      end
    end
  end
end
