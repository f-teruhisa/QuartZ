require 'rails_helper'
require 'login_helper'

describe MembersController, type: :controller do
  describe '#show' do
    before do
      @member = create(:member)
    end
    context 'normal' do
      let(:params) { {id: @member.id} }
      it 'returns status 200' do
        get :show, params: params
        expect(response.status).to eq(200)
      end
      it 'request member was assigned to instance @member' do
        get :show, params: params
        expect(assigns(:member)).to eq @member
      end
    end
  end
end
