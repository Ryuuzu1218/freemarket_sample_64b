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
    before do
      login user
    end
  
    it "データが入力されているか？" do
    item=build(:item)
    end

    context '保存に成功した場合' do
              subject {
          post :create,
          params: params
        }
      it 'itemを保存すること' do
        item=build(:item)
        binding.pry
        expect{post :create, params:params}.to change(Item, :count).by(1)
       
      end
        it '入力が不適切の場合、:newに飛ぶ' do
          binding.pry
          expect(post :create).to redirect_to(new_item_path)
        end
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