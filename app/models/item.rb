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

  # scope
  # カテゴリごとにアイテムを６つまで取得する
  scope :get_category, -> (number) { where(category_id: Category.where(ancestry:nil).find(number).indirects).limit(6) }
end