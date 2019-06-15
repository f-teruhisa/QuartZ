require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'organization validates' do
    context 'normal' do
      it 'is valid organization' do
        organization = Organization.new(
          name: 'Tanaka',
          url: 'http://example.com',
          image_url: 'test.png',
          text: 'text',
          numbers_of_groups: 1
        )
        expect(organization.valid?).to eq(true)
      end
    end
    context 'abnormal' do
      it 'is invalid without a name' do
        organization = Organization.new(name: nil)
        expect(organization.valid?).to eq(false)
      end

      it 'is invalid without url' do
        organization = Organization.new(url: nil)
        expect(organization.valid?).to eq(false)
      end

      it 'is invalid without settings numbers_of_groups' do
        organization = Organization.new(numbers_of_groups: nil)
        expect(organization.valid?).to eq(false)
      end
    end
  end
end
