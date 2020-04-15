class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  belongs_to :user,  optional: true

  # バリデーション
  validates :sending_first_name, :sending_last_name, :sending_first_name_kana, :sending_last_name_kana, :postal_code, :prefecture_id, :city, :town, presence: true
end
