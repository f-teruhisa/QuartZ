require 'rails_helper'

describe OrganizationsController, type: :controller do
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
