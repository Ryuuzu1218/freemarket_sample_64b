require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user)      { create(:user) }
  let(:item)      { create(:item) }
  let(:category)  { create(:category)}
  describe '#index' do

    context 'ログインしている場合' do
      before do
        login user
      end

      it '@parentsに期待した値が入っていること' do
        parents = Category.all.limit(13)
        get :index
        expect(assigns(:parents)).to match(parents.sort)
      end

      it '@itemsに期待した値が入っていること' do
        items = create_list(:item, 3, user_id: user.id , category_id: 30)
        get :index
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it 'index.html.erb に遷移すること' do
        get :index
        expect(response).to render_template :index
      end
    end
    
    context 'ログインしていない場合' do

      it '@itemsに期待した値が入っていること' do
        items = create_list(:item, 3, user_id: user.id , category_id: category.id)
        get :index
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it 'index.html.erb に遷移すること' do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end