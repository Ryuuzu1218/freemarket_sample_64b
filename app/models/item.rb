class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :sending_days
  belongs_to_active_hash :shipping_origin
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images,allow_destroy: true
  belongs_to :user
  belongs_to :category

  validates :name, :user_id, :item_images, :category_id, :price, :transaction_status, :sending_days_id, :shipping_origin_id, :delivery_charge_id, :condition_id, presence: true
  validates :explanation, presence: true, length: { maximum: 1000 }

end