class Item < ApplicationRecord
# has_many :evaluation, dependent: :destroy
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
# belongs_to :transaction
# has_many :comments, dependent: :destroy
# belongs_to :user
# belongs_to :category
end
