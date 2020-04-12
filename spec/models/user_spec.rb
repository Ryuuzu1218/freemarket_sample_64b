require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネームが空では登録できない
    it "it invalid without a nickname" do
      user = build(nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # メールが空では登録できない
    it "it invalid without a email" do
      user = build(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # パスワードが空では登録できない
    it "it invalid without a password" do
      user = build(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # パスワードが登録されてもpassword_confirmationが空では登録できない
    it "it invalid without a password_confirmation although with a password" do
      user = build(password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end
    
    # パスワードが７文字以上で登録ができる
    it "is vaild with a password that has more than 7 characters" do
      user = build(password: "p1ck10t", password_confirmation: "p1ck10t")
      user.valid?
      expect(user).to be_valid
    end

    # パスワードがが6文字以下なら登録ができない
    it "is invaild with a password that has less than 6 characters" do
      user = build(password: "10ako", password_confirmation: "10ako")
      user.valid?
      expect(user.errors[:password]).to include("")
    end

    # 名字が空では登録ができない
    it "is invalid without a first_name" do
      user = build(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 名前が空では登録ができない
    it "is invalid without a last_name" do
      user = build(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 
    it "is invalid without a first_name_kana" do
      user = build(first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      user = build(last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      user = build(birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without a money" do
      user = build(money: nil)
      user.valid?
      expect(user.errors[:money]).to include("can't be blank")
    end

    it "is invalid without a point" do
      user = build(point: nil)
      user.valid?
      expect(user.errors[:point]).to include("can't be blank")
    end

    # # パスワードに英字、数字が含まれているか
    # it "is valid with a password that contains letters and numbers" do
    #   user = build(password: 1t0oka)
    #   user.valid?
    #   expect(user).to be_valid
    # end

    # # パスワードが数字のみのため登録できない
    # it "is invalid with a password expect for numbers" do
    #   user = build(password: 1234567)
    #   user.valid?
    #   expect(user.errors[:password][0]).to include("")
    # end

    # # パスワードが英字のみのため登録ができない
    # it "is invalid with a password expect for alphabet" do
    #   user = build(password: kokekko)
    #   user.valid?
    #   expect(user.errors[:password][0]).to include("")
    # end

    # # 名字をひらがなでは登録できない
    # it "is invalid with a first_name_kana that katakana" do
    #   user = build(first_name_kana: "あ")
    #   user.valid?
    #   expect(user.errors[first_name_kana][0]).to include("")
    # end

    # # 名前をひらがなでは登録できない
    # it "is invalid with a last_name_kana that katakana" do
    #   user = build(last_name_kana: "あ")
    #   user.valid?
    #   expect(user.errors[last_name_kana][0]).to include("")
    end


end