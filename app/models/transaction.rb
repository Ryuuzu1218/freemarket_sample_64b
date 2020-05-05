class Transaction < ApplicationRecord
  belongs_to :item
  has_many :users, through: :user_transactions
  has_many :user_transactions
end