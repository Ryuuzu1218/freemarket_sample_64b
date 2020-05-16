crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :item do
  link "商品出品", new_item_path
  parent :root
end

crumb :card do
  link "カード表示", card_path
  parent :mypage
end

crumb :cards do
  link "カード登録", new_card_path
  parent :mypage
end