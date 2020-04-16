FactoryBot.define do

  factory :address do
    sending_first_name             {"栄"}
    sending_last_name              {"太郎"}
    sending_first_name_kana        {"サカエ"}
    sending_last_name_kana         {"タロウ"}
    postal_code                    {"1234567"}
    prefecture_id                  {"23"}
    city                           {"名古屋市中区"}
    town                           {"3-2"}
  end
end 