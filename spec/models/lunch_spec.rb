require 'rails_helper'

RSpec.describe Lunch, type: :model do
  describe 'lunch validates' do
    context 'normal' do
      let(:organization) { create(:organization) }
      it 'is valid lunch' do
        lunch = Lunch.new(
          organization_id: organization.id
        )
        expect(lunch.valid?).to eq(true)
      end
    end

    context 'abnormal' do
      it 'is invalid without organization_id' do
        lunch = Lunch.new(organization_id: nil)
        expect(lunch.valid?).to eq(false)
      end
    end
  end
end
