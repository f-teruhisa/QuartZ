require 'rails_helper'
require 'login_helper'

describe OrganizationsController, type: :controller do
  include_context 'logged_in'
  describe '#index' do
    context 'normal' do
      it 'returns status 200' do
        get :index
        expect(response.status).to eq(200)
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
end
