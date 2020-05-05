class Transaction < ApplicationRecord
  belongs_to :item
  has_many :saler, class_name: 'Users', through: :user_transactions
  has_many :buyer, class_name: 'Users', through: :user_transactions
  has_many :user_transactions
end