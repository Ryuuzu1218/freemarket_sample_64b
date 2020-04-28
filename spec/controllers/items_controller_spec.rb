require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  describe '#index' do

    context 'ログインしている場合' do
      before do
        login user
        get :index
        items = create_list(:item, 10, user_id: user.id , category_id: category.id)
        parents = build(:category)
      end

      it '@parentsに期待した値が入っていること' do
        expect(assigns(:category)).to match(parents)
      end

      it '@itemsに期待した値が入っていること' do
        expect(assigns(:items)).to match(items)
      end

      it 'index.html.erb に遷移すること' do
        expect(response).to render_template :index
      end
    end
    
    context 'ログインしていない場合' do
      before do
        get :index
        items = create_list(:item, 10, category_id: category.id, user_id: user.id) 
      end

      it 'index.html.erb に遷移すること' do
        expect(response).to render_template :index
      end
    end
  end
end