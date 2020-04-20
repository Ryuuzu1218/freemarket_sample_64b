require 'rails_helper'

describe Users::RegistrationsController do
  describe 'GET #new' do
    it 'new.html.hamlに遷移すること' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      expect(response).to render_template :new
    end
  end

  # describe 'POST #create' do
  #   it 'a' do
  #     request.env["devise.mapping"] = Devise.mappings[:user]
  #     post :create
  #     expect(response).to render_template :new
  #   end
  # end

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
          expect(response).to render_template :new2
        end
    end
  end

  describe 'POST #new3' do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      session["devise.regist_data"] == {user: @user}.clear
      binding.pry
    end
      context '有効なデータの場合' do
        subject{
          address_params = attributes_for(:address)
          post :new3, params: { address: address_params},
                                  session: {
                                    sending_first_name:             "栄",
                                    sending_last_name:              "太郎",
                                    sending_first_name_kana:        "サカエ",
                                    sending_last_name_kana:         "タロウ",
                                    postal_code:                    "1234567",
                                    prefecture_id:                  "23",
                                    city:                           "名古屋市中区",
                                    town:                           "3-2",
                                  }
        }
        it "" do
          subject
          expect(response).to render_template :new_address
        end
    end
  end

  describe 'POST #create' do
    it '' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      @user = attributes_for(:user)
      session["devise.regist_data"] = {user: @user}
      session["devise.regist_data"] = {user: @password}

    end
  end
  describe 'GET #new3' do
    it '' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      @user = attributes_for(:user)
      session["devise.regist_data"] = {user: @user}
      @address = attributes_for(:address)
    end
  end
end