require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'member validates' do
    it 'is invalid without lunch_id' do
      @group = Group.new(lunch_id: nil)
      expect(@group.valid?).to eq(false)
    end

    it 'is invalid without a rank' do
      @group = Group.new(rank: nil)
      expect(@group.valid?).to eq(false)
    end
  end
end
