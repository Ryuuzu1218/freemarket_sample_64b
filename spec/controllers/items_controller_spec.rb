require 'rails_helper'

describe ItemsController, type: :controller  do
  describe 'GET #new' do
  #ログインしている状態にする
  let(:user) { create(:user) }
  before do
    login user
  end
    it "new.html.hamlに遷移する" do
      get :new
      expect(response).to render_template :new
    end

  describe 'POST #create' do
  let(:params){build(:item)}
  context 'ログインしている場合' do
    it "データが入力されているか？" do
    item=build(:item)
    end
   end
  end
 end






 #ログインしていない時の処理
 it "ログインしていないとnew_user_session_pathに遷移する" do
  get :new
  expect(response).to redirect_to(new_user_session_path)
  # expect(response).to render_template :new
end


end