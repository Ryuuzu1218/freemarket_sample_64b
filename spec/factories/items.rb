FactoryBot.define do
  
  factory :item do
    name                    {Faker::Name.last_name}
    likes                   {"0"}
    category_id             {"20"}
    user
    price                   {"4000"}
    explanation             {"説明です"}
    brand                   {"ブランド"}
    transaction_status      {"1"}
    sending_days_id         {"1"}
    shipping_origin_id      {"1"}
    delivery_charge_id      {"1"}
    condition_id            {"1"}
    created_at              { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    item_images             { [build(:item_image)] }
  end
end

# item.likes = 0
# item.category_id = 30
# item.item_images = [ item_image ]