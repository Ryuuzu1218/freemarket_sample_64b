require 'rails_helper'
describe Address do
  describe '#create' do
    it "is valid with a sending_first_name, sending_last_name, sending_first_name_kana, sending_last_name_kana, postal_code, prefecture_id, city, town" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 氏名が空では登録できない
    it "it invalid without a sending_first_name" do
      address = build(:address, sending_first_name: nil)
      address.valid?
      expect(address.errors[:sending_first_name]).to include("can't be blank")
    end

    # 名前が空では登録できない
    it "it invalid without a sending_last_name" do
      address = build(:address, sending_last_name: nil)
      address.valid?
      expect(address.errors[:sending_last_name]).to include("can't be blank")
    end

    # 氏名(カナ)が空では登録できない
    it "it invalid without a sending_first_name_kana" do
      address = build(:address, sending_first_name_kana: nil)
      address.valid?
      expect(address.errors[:sending_first_name_kana]).to include("can't be blank")
    end

    # 名前(カナ）が空では登録できない
    it "it invalid without a sending_first_name_kana" do
      address = build(:address, sending_last_name_kana: nil)
      address.valid?
      expect(address.errors[:sending_last_name_kana]).to include("can't be blank")
    end

    # 氏名は全角で入力でしているか
    it "is valid with a sending_first_name entered full-width" do
      address = build(:address, sending_first_name: "ぁ-んァ-ン一-龥")
      address.valid?
      expect(address).to be_valid
    end

    # 名前は全角で入力でしているか
    it "is valid with a sending_last_name entered full-width" do
      address = build(:address, sending_last_name: "ぁ-んァ-ン一-龥")
      address.valid?
      expect(address).to be_valid
    end

    # 氏名(カナ)は全角で入力でしているか
    it "is valid with a sending_first_name_kana entered full-width" do
      address = build(:address, sending_first_name_kana: "サカエ")
      address.valid?
      expect(address).to be_valid
    end

    # 名前(カナ)は全角で入力でしているか
    it "is valid with a sending_last_name_kana entered full-width" do
      address = build(:address, sending_last_name_kana: "タロウ")
      address.valid?
      expect(address).to be_valid
    end

    # 郵便番号は入力しているか
    it "it valid with a postal_code" do
      address = build(:address, postal_code: "1234567")
      address.valid?
      expect(address).to be_valid
    end

    # 郵便番号が半角数字の時以外登録できない
    it "郵便番号が半角数字の時以外登録できない" do
      address = build(:address, postal_code: "ああああああ")
      address.valid?
      expect(address.errors[:postal_code]).to include("is not a number")
    end
    
    # 郵便番号が半角数字のみの場合登録できる
    it "郵便番号が半角数字のみの場合登録できる" do
      address = build(:address, postal_code: "1111111")
      address.valid?
      expect(address).to be_valid
    end

    # 都道府県は入力しているか
    it "it valid with a prefecture_id that has less than 48" do
      address = build(:address, prefecture_id: "48")
      address.valid?
      expect(address).to be_valid
    end

    # 市区町村は入力しているか
    it "it valid with a city" do
      address = build(:address, city: "中区")
      address.valid?
      expect(address).to be_valid
    end
    # 番地は入力しているか
    it "it valid with a town" do
      address = build(:address, town: "2-3")
      address.valid?
      expect(address).to be_valid
    end
  end
end 