require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'organization validates' do
    context 'normal' do
      it 'is valid organization' do
        @organization = Organization.new(
          name: Faker::Name.name,
          url: Faker::Internet.url,
          image_url: Faker::Internet.url + '.png',
          text: Faker::Lorem.sentence,
          numbers_of_groups: Faker::Number.number(1)
        )
        expect(@organization.valid?).to eq(true)
      end
    end
    context 'abnormal' do
      it 'is invalid without a name' do
        @organization = Organization.new(name: nil)
        expect(@organization.valid?).to eq(false)
      end

      it 'is invalid without url' do
        @organization = Organization.new(url: nil)
        expect(@organization.valid?).to eq(false)
      end

      it 'is invalid without settings numbers_of_groups' do
        @organization = Organization.new(numbers_of_groups: nil)
        expect(@organization.valid?).to eq(false)
      end
    end
  end
end
