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

      it 'request member was assigned to member instance' do
        get :show, params: params
        expect(assigns(:member)).to eq member
      end

      it 'returns show template' do
        get :show, params: params
        expect(response).to render_template :show
      end
    end

    context 'abnormal' do
      let(:params) { {id: member.id.to_i + 1} }

      it 'return Record Not Found Error' do
        expect {
          get :show, params: params
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#edit' do
    include_context 'logged_in'

    context 'normal' do
      let(:params) { {id: member.id} }

      it 'return status 200' do
        get :edit, params: params
        expect(response.status).to eq(200)
      end

      it 'request member was assigned to member instance' do
        get :edit, params: params
        expect(assigns(:member)).to eq member
      end

      it 'return edit template' do
        get :edit, params: params
        expect(response).to render_template :edit
      end

      context 'show from another member(NOT current member)' do
        let(:another_member) { create(:member) }
        let(:params) { {id: another_member.id} }

        it 'redirect to show template' do
          get :edit, params: params
          expect(response).to redirect_to(member_path)
        end

      end
    end

    context 'abnormal' do
    let(:params) { {id: member.id.to_i + 1} }

      it 'return Record Not Found Error' do
        expect {
          get :edit, params: params
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end

    end
  end
end
