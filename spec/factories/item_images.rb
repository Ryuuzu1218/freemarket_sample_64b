FactoryBot.define do 
  factory :item_image do
    image {File.open("#{Rails.root}/public/images/default.jpg")}
  end
end