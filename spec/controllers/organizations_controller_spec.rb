require 'rails_helper'
require 'login_helper'

describe OrganizationsController, type: :controller do
  include_context 'logged_in'
  let(:organization) { create(:organization) }
  let(:params) { {id: organization.id} }

  describe '#index' do
    context 'normal' do
      it 'returns status 200' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#show' do
    context 'normal' do
      it 'returns status 200 with params' do
        get :show, params: params
        expect(response.status).to eq(200)
      end

      it 'returns expected organization show data' do
        get :show, params: params
        expect(assigns(:organization)).to eq organization
      end
    end
  end

  describe '#create' do
    context 'normal' do
      let(:params) do
        {
          organization: {
            name: 'name',
            url: 'https://example.com',
            image_url: 'example.png',
            text: 'text'
          }
        }
      end

      it 'Organizations are created' do
        expect { post :create, params: params }.to change { Organization.count }.by(1)
      end
    end
  end

  describe '#edit' do
    context 'abnormal' do
      it 'return status 302 when not organizer member access' do
        get :edit, params: params
        expect(response.status).to eq(302)
      end
    end
  end

  describe '#update' do
    context 'normal' do
      let(:params) do
        {
          organization: {
            name: 'changed name',
            url: 'https://example.io',
            image_url: 'example.jpg',
            text: 'changed text'
          },
          id: organization.id
        }
      end

      it 'return 302 complete update' do
        get :update, params: params
        expect(response.status).to eq(302)
      end
    end
  end
end
