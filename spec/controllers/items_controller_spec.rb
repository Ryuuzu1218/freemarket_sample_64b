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
  end


 describe 'POST #create' do
      subject { post :create, params }
      let(:user) { create(:user) }
        let(:params) do
          (build(:item))
        end
  context 'ログインしている場合' do
    before do
      login user
    end
    context '保存に成功した場合' do
      it 'itemを保存すること' do
        item = build(:item)
        binding.pry
        expect{post :create, params: params}.to change(Item, :count).by(1)
      end
        it '入力が不適切の場合、:newに飛ぶ' do
          expect(post :create).to redirect_to(new_item_path)
        end
    end
  end
 end

 #ログインしていない時の処理
      it "ログインしていないとnew_user_session_pathに遷移する" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
end


