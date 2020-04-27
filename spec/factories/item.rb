FactoryBot.define do

  factory :item do
    item_images              {[build(:item_image)]}
    user_id                  {"1"}
    name                     {"柑橘"}
    explanation              {"酸っぱいのを好むか甘いのを好むかで評価が分かれる"}
    category_id              {"365"}
    brand                    {"あきひめ"}
    condition_id             {"1"}
    delivery_charge_id       {"1"}
    shipping_origin_id       {"24"}
    sending_days_id          {"2"}
    price                    {"3000"}
  end
end 

