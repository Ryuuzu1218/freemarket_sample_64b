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
  image= Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.jpg')) 
  subject { post :create, params: { item: {
    user_id:                  '1',
    name:                     "柑橘",
    explanation:              "酸っぱい",
    category_id:              '365',
    brand:                    "あきひめ",
    condition_id:             '1',
    delivery_charge_id:       '1',
    shipping_origin_id:       '24',
    sending_days_id:          '2',
    price:                    '3000',
    images_attributes: [item_image: image]
   }}
  }


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
        subject
        expect{subject}.to change(Item, :count).by(1)
      end
        it '入力が適切な場合、:indexに飛ぶ' do
          expect{subject}.to redirect_to(root_path)
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


