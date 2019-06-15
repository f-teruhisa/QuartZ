require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'member validates' do
    context 'normal' do
      let(:lunch) { create(:lunch) }
      it 'valid group' do
        group = Group.new(
          image_url: 'test.png',
          url: 'http://example.com',
          comment: 'text',
          lunch_id: lunch.id,
          rank: 0
        )
        expect(group.valid?).to eq(true)
      end
    end
    context 'abnormal' do
      it 'is invalid without lunch_id' do
        group = Group.new(lunch_id: nil)
        expect(group.valid?).to eq(false)
      end

      it 'is invalid without a rank' do
        group = Group.new(rank: nil)
        expect(group.valid?).to eq(false)
      end
    end
  end
end
