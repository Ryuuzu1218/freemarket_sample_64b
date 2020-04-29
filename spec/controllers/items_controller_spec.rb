require 'rails_helper'

describe ItemsController, type: :controller  do
  describe 'GET #new' do
    it "new.html.hamlに遷移する" do
      get :new
      expect(response).to render_template :new
    end

describe 'POST #create' do
    it "データが入力されているか？" do
    item=build(:item)
    end

    it "" do
      subject
      expect(response).to redirect_to :index
    end

end
end
end