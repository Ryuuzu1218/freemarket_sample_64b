FactoryBot.define do
  
  factory :user do
    nickname               {"tarochan"}
    email                  {"sakae@gmail.com"}
    password               {"a0k9aaa"}
    password_confirmation  {"a0k9aaa"}
    first_name             {"栄"}
    last_name              {"太郎"}
    first_name_kana        {"サカエ"}
    last_name_kana         {"タロウ"}
    birthday               {"19900412"}
    money                  {"10000"}
    point                  {"100200"}
  end
end