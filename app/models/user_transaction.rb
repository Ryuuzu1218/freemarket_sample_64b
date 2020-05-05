class UserTransaction < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :saler, class_name: 'User'
  belongs_to :transaction
end