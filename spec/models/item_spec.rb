require 'rails_helper'
describe Item do
  describe '#create' do
  let(:image_path) { File.join(Rails.root, 'spec/factories/test.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
    it "0.商品出品のバリデーションが機能しているか？" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 商品名が空では登録できない
    it "1.it invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 説明が空では登録できない
    it "2.it invalid without a explanation" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end

    # 説明が1000文字以上なら登録ができない
    it "3.is invaild with a explanation that has more than 1000 characters" do
      item = build(:item, explanation:"qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolok
        qawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokqawsedrftgyhujikolokw")
        #↑1001文字
      item.valid?
        expect(item.errors[:explanation]).to include("is too long (maximum is 1000 characters)")
      end

    # カテゴリが空（3番目が選択されてない状態）では登録できない
    it "4.it invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    # 状態（condition_id）が空では登録できない
    it "5.it invalid without a condition_id" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    # 費用負担（delivery_charge_id ）が空では登録できない
    it "6.it invalid without a delivery_charge_id " do
        item = build(:item, delivery_charge_id: nil)
        item.valid?
        expect(item.errors[:delivery_charge_id ]).to include("can't be blank")
      end
  
    # 配送元（shipping_origin_id）が空では登録できない
    it "7.it invalid without a shipping_origin_id" do
        item = build(:item, shipping_origin_id: nil)
        item.valid?
        expect(item.errors[:shipping_origin_id]).to include("can't be blank")
      end
  
    # 配送期間（sending_days_id）が空では登録できない
    it "8.it invalid without a sending_days_id" do
        item = build(:item, sending_days_id: nil)
        item.valid?
        expect(item.errors[:sending_days_id]).to include("can't be blank")
      end
  
    # 価格が300未満なら登録ができない
    it "9.is invaild with a password that has less than ￥300" do
        item = build(:item, price: '299')
        item.valid?
        expect(item.errors[:price]).to include("must be greater than 299")
      end

    # 価格が10,000,000以上なら登録ができない
    it "10.is invaild with a password that has more than ￥10,000,000" do
        item = build(:item, price: '10000001')
        item.valid?
        expect(item.errors[:price]).to include("must be less than 9999999")
      end

    end
  end