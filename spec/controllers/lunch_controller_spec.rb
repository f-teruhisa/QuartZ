require 'rails_helper'
require 'login_helper'

describe LunchController, type: :controller do
  include_context 'logged_in'

  describe '#index' do
    let(:organization) { create(:organization) }

    context 'normal' do
      let(:params) { { organization_id: organization.id } }
      let(:lunch) { create(:lunch, organization_id: organization.id) }

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

    context 'abnormal' do
      let(:params) { { organization_id: organization.id.to_i + 1 } }

      it 'raise Record Not Found Error' do
        expect do
          get :index, params: params
        end.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#show' do
    context 'normal' do
      let(:organization) { create(:organization, numbers_of_groups: 1) }
      let(:lunch) { create(:lunch, organization_id: organization.id) }
      let(:group) { create(:group, lunch_id: lunch.id) }
      let(:params) { { id: lunch.id, organization_id: organization.id } }

      it 'return status 200' do
        get :show, params: params
        expect(response.status).to eq(200)
      end

      it 'asigns resources' do
        get :show, params: params
        expect(assigns(:lunch)).to eq lunch
        expect(assigns(:groups)).to contain_exactly group
      end

      it 'render show template' do
        get :show, params: params
        expect(response).to render_template :show
      end
    end

    context 'abnormal' do
      let(:organization) { create(:organization, numbers_of_groups: 1) }
      let(:lunch) { create(:lunch, organization_id: organization.id) }
      let(:group) { create(:group, lunch_id: lunch.id) }
      let(:params) { { id: lunch.id + 1, organization_id: organization.id } }

      it 'raise Record Not Found Error' do
        expect do
          get :show, params: params
        end.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
