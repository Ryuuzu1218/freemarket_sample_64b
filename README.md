# DB設計
## Credit card
|Column|Type|Options|
|------------|------------|------------|
|user|reference|null: false, foreign_key: true|
|costomer|references|null: false, foreign_key: true|
|card|reference|null: false, foreign_key: true|

### Association
- belongs_to :user

## Information
|Column|Type|Options|
|------------|------------|------------|
|user|reference|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user

## User
|Column|Type|Options|
|------------|------------|------------|
|nickname|string|null: false, unique: true, index|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false
|last_name_kana|string|null: false
|birthday|date|null: false|
|email|string|null: false|
|password|string|null: false|
|money|integer|default: 0|
|image|string||
|point|integer|default: 0|

### Association
- has_many :evaluations, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :informations, dependent: :destroy
- has_many :items
- has_many :comments
- has_many :transactions, through: :user_transactions
- has_many :user_transactions
- has_many :messages
- has_one :address, dependent: :destroy

## Message
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|user|reference|null: false, foreign_key: true|
|body|text|null: false|
|transaction|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :transaction

## Comment
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## Transaction
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|status|string|null: false|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
|total_fee|integer|null: false|

### Association
- has_many :messages
- belongs_to :item
- has_many :users, through: :user_transaction
- has_many :user_transactions


## Evaluation
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|good|integer|null: false|
|normal|integer|null: false|
|bad|integer|null: false|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user

## Item
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|name|string|null: false, index|
|likes|integer|null: false|
|category|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
|price|integer|null: false|
|explanation|text||
|brand|string||
|condition_id|integer|null: false|
|delivery_charge_id|integer|null: false|
|shipping_origin_id|integer|null: false|
|sending_days_id|integer|null: false|

### Association
- has_many :evaluation, dependent: :destroy
- has_many :item_images, dependent: :destroy
- belongs_to :transaction
- has_many :comments, dependent: :destroy
- belongs_to :user
- belongs_to :category

## User_transaction
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|user|reference|null: false, foreign_key: true|
|transaction|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :transaction

## Category
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

## Address
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|postal_code|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string||
|phone|integer|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user

## Item_image
|Column|Type|Options|
| ------------ | ------------ | ------------ |
|item|reference|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item