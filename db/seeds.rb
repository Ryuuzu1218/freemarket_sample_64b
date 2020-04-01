lady = Category.create(name:"レディース")

lady_tops = lady.children.create(name:"トップス")
lady_jacket = lady.children.create(name:"ジャケット/アウター")

lady_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"},{name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
lady_jacket.children.create([{name:'トップス'},{name:'アウター'},{name:'パンツ'},{name:'スカート'},{name:'ワンピース'},{name:'ベビードレス'},{name:'おくるみ'},{name:'下着・入義'},{name:'パジャマ'},{name:'ロンパース'},{name:'その他'}])

mens = Category.create(name:"メンズ")

mens_tops = mens.children.create(name:"トップス")
mens_jacket = mens.children.create(name:"ジャケット/アウター")

mens_tops.children.create([{name:'Tシャツ・カットソー（半袖・袖なし）'},{name:'Tシャツ・カットソー（七分・長袖）'},{name:'シャツ'},{name:'ポロシャツ'},{name:'タンクトップ'},{name:'ニット・セーター'},{name:'パーカー'},{name:'カーディガン'},{name:'スウェット'},{name:'ジャージ'},{name:'ベスト'},{name:'その他'}])
mens_jacket.children.create([{name:'テーラードジャケット'},{name:'ノーカラージャケット'},{name:'Gジャン・デニムジャケット'},{name:'レザージャケット'},{name:'ダウンジャケット'},{name:'ラーダースジャケット'},{name:'ミリタリージャケット'},{name:'ナイロンジャケット'},{name:'フライトジャケット'},{name:'ダッフルコート'},{name:'ビーコート'},{name:'ステンカラーコート'},{name:'トレンチコート'},{name:'モッズコート'}])

sumai = Category.create(name:"インテリア・住まい・小物")

sumai_kitchen = sumai.children.create(name:"キッチン・食器")
sumai_bed = sumai.children.create(name:"ベッド・マットレス")

sumai_kitchen.children.create([{name:'食器'},{name:'調理器具'},{name:'収納・キッチン雑貨'},{name:'弁当用品'},{name:'カトラリー（スプーン等）'},{name:'テーブル用品'},{name:'容器'},{name:'エプロン'},{name:'アルコールグッズ'},{name:'浄水器'},{name:'その他'}])
sumai_bed.children.create([{name:'セミシングルベッド'},{name:'シングルベッド'},{name:'セミダブルベッド'},{name:'ダブルベッド'},{name:'ワイドダブルベッド'},{name:'クイーンベッド'},{name:'キングベッド'},{name:'脚付きマットレスベッド'},{name:'マットレス'},{name:'すのこベッド'},{name:'ロフトベッド・システムベッド'},{name:'開閉ベッド・折りたたみベッド'},{name:'収納付き'},{name:'その他'}])
