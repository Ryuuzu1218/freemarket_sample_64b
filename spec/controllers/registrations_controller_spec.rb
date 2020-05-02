require 'rails_helper'

describe Users::RegistrationsController do
  describe 'GET #new' do
    it 'new.html.hamlに遷移すること' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'POST #create' do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end
      context '有効なデータの場合' do
        subject{
          user_params = attributes_for(:user)
          post :create, params: { user: user_params},
                                  session: {
                                    nickname: '桜',
                                    email: "koko@co.jp",
                                    password: "1o2p345",
                                    password_confirmation: "1o2p345",
                                    first_name: "桜",
                                    last_name: "満開",
                                    first_name_kana: 'サクラ',
                                    last_name_kana: "マンカイ",
                                    birthday: "19900101"
                                  }
        }
        it "" do
          subject
          binding.pry
          expect(response).to render_template :new2
        end
    end
  end

  describe 'POST #create' do
    it 'sessionに保存されて遷移しているか' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      @user = attributes_for(:user)
      session["devise.regist_data"] = {user: @user}
      session["devise.regist_data"] = {user: @password}

    end
  end
  describe 'GET #new3' do
    it 'sessionに保存されて遷移しているか' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      @user = attributes_for(:user)
      session["devise.regist_data"] = {user: @user}
      @address = attributes_for(:address)
    end
  end
end