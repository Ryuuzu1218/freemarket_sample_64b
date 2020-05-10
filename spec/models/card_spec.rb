require 'rails_helper'
describe Card do
  describe '#create' do
  let(:user){create(:user)}

    it 'id,ユーザーid,顧客id,カードidなしでは登録できないこと' do
      card = build(:card, user_id: user.id)
      expect(card).to be_valid
    end

    it 'ユーザーidなしでは登録できないこと' do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

    it '顧客idなしでは登録できないこと' do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it 'カードidなしでは登録できないこと' do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end

  end
end