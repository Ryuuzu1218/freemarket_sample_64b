class Transaction < ApplicationRecord
  belongs_to :item
  has_many :seller, class_name: 'Users'
  has_many :buyer, class_name: 'Users'

  validates 

end
