require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, first_name, last_name" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネームが空では登録できない
    it "it invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # メールが空では登録できない
    it "it invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # パスワードが空では登録できない
    it "it invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # パスワードが登録されてもpassword_confirmationが空では登録できない
    it "it invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    
    # パスワードが７文字以上で登録ができる
    it "is vaild with a password that has more than 7 characters" do
      user = build(:user, password: "1k2o334", password_confirmation: "1k2o334")
      user.valid?
      expect(user).to be_valid
    end

    # パスワードがが6文字以下なら登録ができない
    it "is invaild with a password that has less than 6 characters" do
      user = build(:user, password: "10ako", password_confirmation: "10ako")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)", "is too short (minimum is 7 characters)")
    end

    # 名字が空では登録ができない
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 名前が空では登録ができない
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 名字(カナ)が空では登録ができない
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 名前(カナ)が空では登録ができない
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    # 誕生日が空では登録ができない
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # が空では登録ができない
    it "is invalid without a money" do
      user = build(:user, money: nil)
      user.valid?
      expect(user.errors[:money]).to include("can't be blank")
    end

    # が空では登録ができない
    it "is invalid without a point" do
      user = build(:user, point: nil)
      user.valid?
      expect(user.errors[:point]).to include("can't be blank")
    end

    # パスワードに英字、数字が含まれているか
    it "is valid with a password that contains letters and numbers" do
      user = build(:user, password: "1t0okaa", password_confirmation: "1t0okaa")
      user.valid?
      expect(user).to be_valid
    end

    # 氏名は全角で入力でしているか
    it "is valid with a first_name entered full-width" do
      user = build(:user, first_name: "ぁ-んァ-ン一-龥")
      user.valid?
      expect(user).to be_valid
    end

    # 名前は全角で入力でしているか
    it "is valid with a last_name entered full-width" do
      user = build(:user, last_name: "ぁ-んァ-ン一-龥")
      user.valid?
      expect(user).to be_valid
    end

    # 氏名(カナ)は全角で入力でしているか
    it "is valid with a first_name_kana entered full-width" do
      user = build(:user, first_name_kana: "サカエ")
      user.valid?
      expect(user).to be_valid
    end

    # 名前(カナ)は全角で入力でしているか
    it "is valid with a last_name_kana entered full-width" do
      user = build(:user, last_name_kana: "タロウ")
      user.valid?
      expect(user).to be_valid
    end

    # ＠を含んで使用しているか
    it "is valid with a email that includes @" do
      user = build(:user, email: "aaa@aaa.jp")
      user.valid?
      expect(user).to be_valid
    end

    # ドメインを含んで使用しているか
    it "is valid with a email that includes ne.jp" do
      user = build(:user, email: "aaa@aaa.ne.jp")
      user.valid?
      expect(user).to be_valid
    end

    # ドメインを含んで使用しているか
    it "is valid with a email that includes com" do
      user = build(:user, email: "aaa@aaa.com")
      user.valid?
      expect(user).to be_valid
    end

    # 郵便番号が半角数字のみの場合登録できる
    it "is vaild with a postal_code that has only 7 characters" do
      user = build(:user, postal_code:)
      user.valid?
      expect(user).to be_valid
    end

    # 郵便番号が7文字ではないとき登録できない
    it "is invaild with a password that has less than 6 characters" do
      user = build(:user, password: "10ako", password_confirmation: "10ako")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)", "is too short (minimum is 7 characters)")
    end

    # 郵便番号が7文字の時は登録できる
    it "is valid with a password that contains letters and numbers" do
      user = build(:user, password: "1t0okaa", password_confirmation: "1t0okaa")
      user.valid?
      expect(user).to be_valid
    end

    # 郵便番号が半角数字の時以外登録できない
    it "is invalid without a point" do
      user = build(:user, point: nil)
      user.valid?
      expect(user.errors[:point]).to include("can't be blank")
    end

  end
end