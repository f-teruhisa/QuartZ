require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'member validates' do
    it "is invalid without a name" do
      @member = Member.new(name: nil)
      expect(@member.valid?).to eq(false)
    end

    it "is invalid without a email" do
      @member = Member.new(email: nil)
      expect(@member.valid?).to eq(false)
    end

    it "is invalid without a password" do
      @member = Member.new(password: nil)
      expect(@member.valid?).to eq(false)
    end
  end

  describe '#search' do
    before do
      @member = Member.create(
        name: 'Test',
        email: 'test@example.com',
        password: 'abcd0123'
      )

      @other_member = Member.create(
        name: 'Example',
        email: 'example@example.com',
        password: 'abcdefg'
      )
    end

    context "search by 'Test'" do
      it 'return @member' do
        expect(Member.search('Test')).to include(@member)
      end

      it 'NOT return @member' do
        expect(Member.search('Test')).to_not include(@other_member)
      end
    end

    context "search by 'Test'" do
      it 'NOT return' do
        expect(Member.search('Mike')).to be_empty
      end
    end
  end
end
