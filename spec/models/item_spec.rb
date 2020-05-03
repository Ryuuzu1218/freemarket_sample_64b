require 'rails_helper'
describe 'scope' do
  describe 'get_category' do
    let(:category) {create(:category)}
    it 'get_categoryに期待した値が入っているか' do
      number = category.id
      get_category = Category.find(number) 
      expect(category).to eq get_category
    end
  end
end

describe Item do
  describe '#create' do
    let(:user) {create(:user)}

    it "商品名、ユーザーID、カテゴリーID、取引情報、発送日数、送料、商品状態、価格、商品説明が空でなければ登録できること" do
      item = build(:item, user_id: user.id)
      expect(item).to be_valid
    end

    it "商品名なしでは登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "ユーザーIDなしでは登録できないこと" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    it "カテゴリーIDなしでは登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "取引情報なしでは登録できないこと" do
      item = build(:item, transaction_status: nil)
      item.valid?
      expect(item.errors[:transaction_status]).to include("can't be blank")
    end

    it "発送日数なしでは登録できないこと" do
      item = build(:item, sending_days_id: nil)
      item.valid?
      expect(item.errors[:sending_days_id]).to include("can't be blank")
    end

    it "送料なしでは登録できないこと" do
      item = build(:item, delivery_charge_id: nil)
      item.valid?
      expect(item.errors[:delivery_charge_id]).to include("can't be blank")
    end

    it "商品状態なしでは登録できないこと" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "価格なしでは登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "価格が数値以外では登録できないこと" do
      item = build(:item, price: "aa")
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end

    it "価格が100000000未満、300以上では登録できること#1" do
      item = build(:item, price: 999999, user_id: user.id)
      item.valid?
      expect(item).to be_valid
    end

    it "価格が100000000未満、300以上では登録できること#2" do
      item = build(:item, price: 300, user_id: user.id)
      item.valid?
      expect(item).to be_valid
    end

    it "価格が300未満では登録できないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("must be greater than 299")
    end

    it "価格が10000000000以上では登録できないこと" do
      item = build(:item, price: "100000000")
      item.valid?
      expect(item.errors[:price]).to include("must be less than 9999999")
    end

    it "価格が小数では登録できないこと" do
      item = build(:item, price: "300.1")
      item.valid?
      expect(item.errors[:price]).to include("must be an integer")
    end

    it "商品説明が1000文字以下では登録できること" do
      item = build(:item, explanation: "#{'あ'*1000}", user_id: user.id)
      item.valid?
      expect(item).to be_valid
    end

    it "商品説明なしでは登録できないこと" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end

    it "商品説明が1000文字より多いと登録できないこと" do
      item = build(:item, explanation: "#{'あ'*1001}")
      item.valid?
      expect(item.errors[:explanation]).to include("is too long (maximum is 1000 characters)")
    end
  end
end
