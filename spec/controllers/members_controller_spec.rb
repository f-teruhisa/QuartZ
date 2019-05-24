require 'rails_helper'
require 'login_helper'

describe MembersController, type: :controller do
  describe '#show' do
    let(:member) { create(:member) }

    context 'normal' do
      let(:params) { {id: member.id} }

      it 'returns status 200' do
        get :show, params: params
        expect(response.status).to eq(200)
      end

      it 'request member was assigned to instance @member' do
        get :show, params: params
        expect(assigns(:member)).to eq member
      end

      it 'returns show template' do
        get :show, params: params
        expect(response).to render_template :show
      end
    end
  end
end
