require 'rails_helper'
describe 'scope' do
  describe 'get_category' do
    create_list(:item)
    category = create(:category)
    (category.id) 

    it 'get_categoryに期待した値が入っているか' do
      expect(:get_cateogry).to eq get_category
    end
  end
end