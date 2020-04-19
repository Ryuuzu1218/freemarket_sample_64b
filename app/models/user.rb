class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :evaluations,  dependent: :destroy
  has_one :credit_card,   dependent: :destroy
  has_many :informations, dependent: :destroy
  has_many :items
  has_many :comments
  has_many :transactions, through: :user_transactions
  has_many :user_transactions
  has_many :messages
  has_one :address,        dependent: :destroy

  # 以下バリデーション
  # 空ではないこと
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :money, :point, presence: true

  # 氏名、ふりがなは全角で入力すること
  # 全角カタカナ、ひらがな、漢字
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  # 全角カタカナ
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

  # 一意性であること(ニックネーム、メールアドレス)
  validates :nickname, :email, uniqueness: true

  # 一致していること, ７文字以上であること（パスワード）
  validates :password, confirmation: true, length: { minimum: 7 }

  # メールアドレスは@とドメインを含むこと
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

end
