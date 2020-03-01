<<<<<<< Updated upstream
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

テストとしてREADMEの内容をこの一行だけ書き換えました。

* ...
=======
>>>>>>> Stashed changes
# DB設計
## Credit card
|Column|Type|Options|
|------------|------------|------------|
|user_id|references|null: false, foreign_key: true|
|costomer_id|references|null: false, foreign_key: true|
|card_id|references |null: false, foreign_key: true|

### Association
- belongs_to :user


## Information
|Column|Type|Options|
|------------|------------|------------|
|user_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :users

## User
|Column|Type|Options|
|------------|------------|------------|
|nickname|string|null: false, unique: true, index|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_ruby|string|null: false
|last_name_ruby|string|null: false
|birthday|date|null: false|
|postal_code|integer|null: false|
|payment|string|null: false|
|email|string|null: false|
|phone|integer|null: false, foreign_key: true|
|password|string|null: false|
|money|integer|null: false|
|image|string|null: false|
|point|integer|null: false|

### Association
- has_many :evaluations
- has_one :credit_card
- has_many :informations
- has_many :items
- has_many :comments
- has_many :transactions, through user_transactions
- has_many :user_transactions
- has_many :messages
- has_one :address

## Message
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|user_id|reference|null: false, foreign_key: true|
|body|text|null: false|
|transaction_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :transaction


## Comment
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## Transaction
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|status|string|null: false|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
|total_fee|integer|null: false|

### Association
- has_many :messages
- belongs_to :item
- has_many :users, through :user_transaction
- has_many :user_transactions


## Evaluation
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|good|integer|null: false|
|normal|integer|null: false|
|bad|integer|null: false|
|user_id|reference|null: false, foreign_key: true|


### Association
- belongs_to :user


## Item
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|name|string|null: false, index|
|likes|integer|null: false|
|category|string|null: false, index|
|user_id|reference|null: false, foreign_key: true|
|price|integer|null: false|
|explanation|text||
|brand|string||
|condition|string|null: false|
|delivery_charge|string|null: false|
|shipping_origin|string|null: false|
|sending_days|integer|null: false|

### Association
- has_many :evaluation
- has_many :item_images
- belongs_to :transaction
- has_many :comments
- belongs_to :user

## User_transaction
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|user_id|references|null: false, foreign_key: true|
|transaction_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :transaction

## Category
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|category_name|string|null: false|
|ancestry|string||

### Association
- has_many :items

## Address
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|prefecture|string|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## Item_image
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|item_id|integer|null: false, foreign_key: true|
|item_image|string|null: false|

### Association
- belongs_to :item