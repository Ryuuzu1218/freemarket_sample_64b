require 'rails_helper'
describe Transaction do
  describe '#transacte' do
  let(:user) {create(:user)}
  let(:category) {create(:category)}
  let(:item) {create(:item, category_id: category.id, user_id: user.id)}

    it "購入者id、商品id、販売者idがないと登録できないこと" do
      transacte = build(:transaction,item_id: item.id)
      expect(transacte).to be_valid
    end

    it "購入者idなしでは登録できないこと" do
      transacte = build(:transaction, buyer_id: nil)
      transacte.valid?
      expect(transacte.errors[:buyer_id]).to include("can't be blank")
    end

    it "販売者idなしでは登録できないこと" do
      transacte = build(:transaction, seller_id: nil)
      transacte.valid?
      expect(transacte.errors[:seller_id]).to include("can't be blank")
    end

    it "商品idなしでは登録できないこと" do
      transacte = build(:transaction, item_id: nil)
      transacte.valid?
      expect(transacte.errors[:item_id]).to include("can't be blank")
    end
  end
end
