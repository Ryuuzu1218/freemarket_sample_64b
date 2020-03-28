class Item < ApplicationRecord
# has_many :evaluation, dependent: :destroy
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images,allow_destroy: true
# belongs_to :transaction
# has_many :comments, dependent: :destroy
# belongs_to :user
# belongs_to :category
end
# =exh.label :image ,class:'label' do
#   =exh.fields_for :item_images do |i|
#    .ex__image--upload--area
#     =i.file_field :image, class: 'none'
#     =icon('fa','camera')
#     クリックして写真をアップロード