require 'rails_helper'

describe IndexController, type: :controller do
  describe '#show' do
    context 'normal' do
      it 'returns status 200' do
        get :show
        expect(response.status).to eq(200)
      end
    end
  end
end
