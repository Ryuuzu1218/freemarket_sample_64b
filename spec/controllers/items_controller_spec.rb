require 'rails_helper'

describe ItemsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移する" do
      get :new
      expect(response).to render_template :new
    end

describe 'POST #create' do

    it "データが入力されているか？" do
    post :create, params: { 
      item_images: [build(:item_image)],
      user_id: '1',
      name: '柑橘',
      explanation: '酸っぱいのを好むか甘いのを好むかで評価が分かれる',
      category_id: '365',
      brand: 'あきひめ',
      condition_id: '1',
      delivery_charge_id: '1',
      shipping_origin_id: '24',
      sending_days_id: '2',
      price: '3000'
    }
    it "" do
      subject
      expect(response).to render_template :index
    end

  end
  end
end
end
